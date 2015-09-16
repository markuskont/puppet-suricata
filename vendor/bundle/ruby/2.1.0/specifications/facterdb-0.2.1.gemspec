# -*- encoding: utf-8 -*-
# stub: facterdb 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "facterdb"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Micka\u{eb}l Can\u{e9}vet"]
  s.date = "2015-08-31"
  s.description = "Contains facts from many Facter version on many Operating Systems"
  s.email = ["mickael.canevet@camptocamp.com"]
  s.executables = ["facterdb"]
  s.files = ["bin/facterdb"]
  s.homepage = "http://github.com/camptocamp/facterdb"
  s.licenses = ["Apache-2.0"]
  s.rubygems_version = "2.2.2"
  s.summary = "A Database of OS facts provided by Facter"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<github_changelog_generator>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<facter>, [">= 0"])
      s.add_runtime_dependency(%q<jgrep>, [">= 0"])
    else
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<github_changelog_generator>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<facter>, [">= 0"])
      s.add_dependency(%q<jgrep>, [">= 0"])
    end
  else
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<github_changelog_generator>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<facter>, [">= 0"])
    s.add_dependency(%q<jgrep>, [">= 0"])
  end
end
