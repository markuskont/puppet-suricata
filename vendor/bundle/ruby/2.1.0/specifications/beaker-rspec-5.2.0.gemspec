# -*- encoding: utf-8 -*-
# stub: beaker-rspec 5.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "beaker-rspec"
  s.version = "5.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppetlabs"]
  s.date = "2015-07-15"
  s.description = "RSpec bindings for beaker, see https://github.com/puppetlabs/beaker"
  s.email = ["sqa@puppetlabs.com"]
  s.homepage = "https://github.com/puppetlabs/beaker-rspec"
  s.licenses = ["Apache2"]
  s.rubygems_version = "2.2.2"
  s.summary = "RSpec bindings for beaker"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.4"])
      s.add_development_dependency(%q<fakefs>, ["~> 0.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<markdown>, [">= 0"])
      s.add_development_dependency(%q<thin>, [">= 0"])
      s.add_runtime_dependency(%q<beaker>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<serverspec>, ["~> 2"])
      s.add_runtime_dependency(%q<specinfra>, ["~> 2"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.4"])
      s.add_dependency(%q<fakefs>, ["~> 0.6"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<markdown>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<beaker>, ["~> 2.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<serverspec>, ["~> 2"])
      s.add_dependency(%q<specinfra>, ["~> 2"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.4"])
    s.add_dependency(%q<fakefs>, ["~> 0.6"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<markdown>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<beaker>, ["~> 2.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<serverspec>, ["~> 2"])
    s.add_dependency(%q<specinfra>, ["~> 2"])
  end
end
