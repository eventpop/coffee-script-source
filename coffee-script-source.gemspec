# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "coffee-script-source"
  spec.version = "2.7.0"
  spec.authors = ["Manassarn Manoonchai"]
  spec.email = ["noom@eventpop.me"]

  spec.summary = "CoffeeScript v2 source for compiling with coffee-rails gem"
  spec.description = "This gem works like coffee-script-source gem but for CoffeeScript v2."
  spec.homepage = "https://github.com/eventpop/coffee-script-source"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  # spec.metadata["allowed_push_host"] = nil

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/eventpop/coffee-script-source"
  spec.metadata["changelog_uri"] = "https://github.com/eventpop/coffee-script-source/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  # spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
