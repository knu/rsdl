#!/usr/bin/env ruby
# vim:encoding=utf-8

require 'mkmf'
require 'erb'

dir_config('sdl') #--with-sdl-dir, --with-sdl-include, or --with-sdl-lib
sdlconfig = with_config('sdl-config', 'sdl-config')

config = {}
config['arch']    = RbConfig::CONFIG['arch']
config['INSTALL'] = RbConfig::CONFIG['INSTALL']
config['RMALL']   = RbConfig::CONFIG['RMALL'] || 'rm -fr'
config['CC']      = RbConfig::CONFIG['CC']
config['CFLAGS']  = RbConfig::CONFIG['CFLAGS']
config['CFLAGS']  += " -I\"#{$hdrdir}\"" if $hdrdir
config['CFLAGS']  += " -I\"#{$arch_hdrdir}\"" if $arch_hdrdir
config['CFLAGS']  += ' ' + `"#{sdlconfig}" --cflags` if sdlconfig and not sdlconfig.empty?
config['LDFLAGS'] = RbConfig::CONFIG['LDFLAGS']
config['LIBS']    = RbConfig::CONFIG['LIBS']
config['LIBS']    += ' ' + `"#{sdlconfig}" --libs` if sdlconfig and not sdlconfig.empty?
config['LIBPATH'] = RbConfig::expand(libpathflag)
config['LIBRUBYARG'] = RbConfig::CONFIG['LIBRUBYARG']
config['EXEEXT']     = RbConfig::CONFIG['EXEEXT']
config['bindir'] = RbConfig::CONFIG['bindir']
config['RSDL']   = RbConfig::CONFIG['RUBY_INSTALL_NAME'].sub(/ruby/, 'rsdl')

headers = []
headers << '#define HAVE_RUBY_SYSINIT 1'  if have_func('ruby_sysinit')
headers << '#define HAVE_RUBY_RUN_NODE 1' if have_func('ruby_run_node')
config['COMMON_HEADERS'] = ([(COMMON_HEADERS || '')]+headers).join("\n")

%w[Makefile rsdl.c].each { |file|
  file_in = ERB.new(File.read(file + '.in'), nil, '%')
  message "creating %s\n" % file
  open(file, 'w') do |f|
    f.print file_in.result
  end
}

