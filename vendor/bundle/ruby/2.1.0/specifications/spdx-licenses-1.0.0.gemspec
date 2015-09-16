# -*- encoding: utf-8 -*-
# stub: spdx-licenses 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "spdx-licenses"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dominic Cleal"]
  s.date = "2014-12-09"
  s.description = "Provides validation and additional data about SPDX licenses and identifiers"
  s.email = "dominic@cleal.org"
  s.homepage = "https://github.com/domcleal/spdx-licenses"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "SPDX license and identifier lookup"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end
