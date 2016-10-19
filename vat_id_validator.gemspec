# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vat_id_validator/version'

Gem::Specification.new do |gem|
  gem.name          = "vat_id_validator"
  gem.version       = VatIdValidator::VERSION
  gem.authors       = %q(Sage One team)
  gem.email         = %q(support@sageone.com)
  gem.homepage      = %q(http://github.com/Sage/vat_id_validator)
  gem.description   = %q{VAT-ID validator based on ActiveModel::EachValidator}
  gem.summary       = %q{VAT-ID validator}
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w[lib]

  gem.add_dependency 'activemodel', '>= 3.2'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cane'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'redcarpet'
  gem.add_development_dependency 'fudge'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'guard-rspec'
end
