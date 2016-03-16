# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prolog/services/markdown_to_html/version'

Gem::Specification.new do |spec|
  spec.name          = "prolog-services-markdown_to_html"
  spec.version       = Prolog::Services::MarkdownToHtml::VERSION
  spec.authors       = ["Jeff Dickey"]
  spec.email         = ["jdickey@seven-sigma.com"]

  spec.summary       = %q{Converts Markdown content to HTML with minimal whitespace.}
  spec.description   = %q{The Prolog::Services::MarkdownToHtml class converts valid
                       Markdown to valid HTML (as well-formed XML; i.e., void element
                       tags such as <br/> are always properly closed). The resulting
                       HTML is rendered as a single line of text with all unnecessary
                       whitespace removed.}
  spec.homepage      = "https://github.com/theprolog/prolog-services-markdown_to_html"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ox", "~> 2.3"
  spec.add_dependency "html-pipeline", "~> 2.3"
  spec.add_dependency "gemoji", "~> 2.1"
  spec.add_dependency "github-markdown", "0.6.9"
  spec.add_dependency "rinku", "~> 1.7", ">= 1.7.3"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_development_dependency "minitest-matchers", "~> 1.4"
  spec.add_development_dependency "minitest-reporters", "~> 1.0"
  spec.add_development_dependency "minitest-tagz", "~> 1.2"
  spec.add_development_dependency "flay", "~> 2.6"
  spec.add_development_dependency "flog", "~> 4.3", ">= 4.3.2"
  spec.add_development_dependency "reek", "~> 3.7"
  spec.add_development_dependency "rubocop", "0.35.1" # FIXME: newer introduces odd config problems
  spec.add_development_dependency "simplecov", "~> 0.10"
  spec.add_development_dependency "pry-byebug", "~> 3.2"
  spec.add_development_dependency "pry-doc", "~> 0.8"
  spec.add_development_dependency "colorize", "~> 0.7", ">= 0.7.7"
  spec.add_development_dependency "awesome_print", "~> 1.6", ">= 1.6.1"
end
