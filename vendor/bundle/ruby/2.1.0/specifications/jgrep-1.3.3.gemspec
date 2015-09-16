# -*- encoding: utf-8 -*-
# stub: jgrep 1.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jgrep"
  s.version = "1.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["P Loubser"]
  s.date = "2012-09-26"
  s.description = "Compare a list of json documents to a simple logical language and returns matches as output"
  s.email = ["ploubser@gmail.com"]
  s.executables = ["jgrep"]
  s.files = ["bin/jgrep"]
  s.homepage = "https://github.com/psy1337/JSON-Grep"
  s.rubygems_version = "2.2.2"
  s.summary = "Compare a list of json documents to a simple logical language and returns matches as output"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end
