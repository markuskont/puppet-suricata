# -*- encoding: utf-8 -*-
# stub: stringify-hash 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "stringify-hash"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppetlabs", "anode"]
  s.date = "2015-07-17"
  s.description = ":test == \"test\""
  s.email = ["qe-team@puppetlabs.com", "alice@puppetlabs.com"]
  s.homepage = "https://github.com/puppetlabs/stringify-hash"
  s.licenses = ["Apache2"]
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby Hash that treats symbols and strings interchangeably!"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<pry>, ["~> 0.10"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<markdown>, [">= 0"])
      s.add_development_dependency(%q<thin>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<pry>, ["~> 0.10"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<markdown>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<pry>, ["~> 0.10"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<markdown>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
  end
end
