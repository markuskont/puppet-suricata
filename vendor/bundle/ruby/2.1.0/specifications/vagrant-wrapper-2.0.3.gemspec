# -*- encoding: utf-8 -*-
# stub: vagrant-wrapper 2.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "vagrant-wrapper"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["BinaryBabel OSS"]
  s.date = "2015-08-04"
  s.description = "Since Vagrant 1.1+ is no longer distributed via Gems, vagrant-wrapper allows you to require and interact\nwith the newer package versions via your Gemfile, shell, or Ruby code. It allows the newer packaged\nversion to take precedence even if the older Vagrant gem remains installed.\nSee https://github.com/org-binbab/gem-vagrant-wrapper for more details.\n"
  s.email = ["projects@binarybabel.org"]
  s.executables = ["vagrant"]
  s.files = ["bin/vagrant"]
  s.homepage = "http://code.binbab.org"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Wrapper/binstub for os packaged version of Vagrant."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<vagrant>, ["= 1.0.7"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<vagrant>, ["= 1.0.7"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<vagrant>, ["= 1.0.7"])
  end
end
