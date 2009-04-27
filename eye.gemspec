# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{eye}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Run Paint Run Run"]
  s.date = %q{2009-04-27}
  s.email = %q{runrun@runpaint.org}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "lib/eye.rb",
    "spec/eye/eye_spec.rb",
    "spec/eye/new_spec.rb",
    "spec/eye/numbers_spec.rb",
    "spec/eye/see_spec.rb",
    "spec/eye/seen_spec.rb",
    "spec/eye/type_spec.rb",
    "spec/eye_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/runpaint/eye}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/eye_spec.rb",
    "spec/eye/eye_spec.rb",
    "spec/eye/new_spec.rb",
    "spec/eye/see_spec.rb",
    "spec/eye/type_spec.rb",
    "spec/eye/seen_spec.rb",
    "spec/eye/numbers_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bloomfilter>, [">= 0.1.1"])
    else
      s.add_dependency(%q<bloomfilter>, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<bloomfilter>, [">= 0.1.1"])
  end
end
