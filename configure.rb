#!/usr/bin/env ruby
# vim:encoding=utf-8

require 'mkmf'
require 'erb'

dir_config('sdl') #--with-sdl-dir, --with-sdl-include, or --with-sdl-lib
sdlconfig = with_config('sdl-config', 'sdl-config')

config = {}
config['arch']    = Config::CONFIG['arch']
config['INSTALL'] = Config::CONFIG['INSTALL']
config['RMALL']   = Config::CONFIG['RMALL'] || 'rm -fr'
config['CC']      = Config::CONFIG['CC']
config['CFLAGS']  = Config::CONFIG['CFLAGS']
config['CFLAGS']  += " -I\"#{$hdrdir}\"" if $hdrdir
config['CFLAGS']  += " -I\"#{$arch_hdrdir}\"" if $arch_hdrdir
config['CFLAGS']  += ' ' + `"#{sdlconfig}" --cflags` if sdlconfig and not sdlconfig.empty?
config['LDFLAGS'] = Config::CONFIG['LDFLAGS']
config['LIBS']    = Config::CONFIG['LIBS']
config['LIBS']    += ' ' + `"#{sdlconfig}" --libs` if sdlconfig and not sdlconfig.empty?
config['LIBPATH'] = RbConfig::expand(libpathflag)
config['LIBRUBYARG'] = Config::CONFIG['LIBRUBYARG']
config['EXEEXT']     = Config::CONFIG['EXEEXT']
config['bindir'] = Config::CONFIG['bindir']
config['RSDL']   = Config::CONFIG['RUBY_INSTALL_NAME'].sub(/ruby/, 'rsdl')

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

