# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsdl}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryuichi Sakamoto", "Akinori MUSHA"]
  s.date = %q{2010-02-18}
  s.default_executable = %q{rsdl}
  s.description = %q{RSDL is an SDL initialized ruby interpreter which makes SDL
applications possible to run on such platforms as Mac OS X where SDL
needs to be initialized before a ruby interpreter is invoked.
}
  s.email = %q{knu@idaemons.org}
  s.executables = ["rsdl"]
  s.extensions = ["extconf.rb"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "Makefile.in",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/rsdl",
     "extconf.rb",
     "rsdl.c.in",
     "rsdl.gemspec",
     "test/helper.rb",
     "test/test_rsdl.rb"
  ]
  s.homepage = %q{http://github.com/knu/rsdl}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{SDL initialized ruby interpreter}
  s.test_files = [
    "test/helper.rb",
     "test/test_rsdl.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

