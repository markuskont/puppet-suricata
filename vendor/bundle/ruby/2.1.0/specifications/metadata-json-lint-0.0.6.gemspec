# -*- encoding: utf-8 -*-
# stub: metadata-json-lint 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "metadata-json-lint"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Spencer Krum", "HP Development Corporation LP"]
  s.date = "2015-01-08"
  s.description = "Utility to verify Puppet metadata.json files"
  s.email = "nibz@spencerkrum.com"
  s.executables = ["metadata-json-lint"]
  s.files = ["bin/metadata-json-lint"]
  s.homepage = "http://github.com/nibalizer/metadata-json-lint"
  s.licenses = ["Apache-2.0"]
  s.rubygems_version = "2.2.2"
  s.summary = "metadata-json-lint /path/to/metadata.json"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spdx-licenses>, ["~> 1.0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<spdx-licenses>, ["~> 1.0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<spdx-licenses>, ["~> 1.0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
