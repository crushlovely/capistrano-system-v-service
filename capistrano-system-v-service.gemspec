# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-system-v-service'
  spec.version       = '0.1.0'
  spec.authors       = ['PJ Kelly', 'Pablo Castillo']
  spec.email         = ['pj@crushlovely.com', 'pablo@crushlovely.com']
  spec.description   = %q{Easily define Capistrano 3.x tasks for your System V services.}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/crushlovely/capistrano-system-v-service'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0.pre'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
