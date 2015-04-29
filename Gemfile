source 'https://rubygems.org'

gem 'berkshelf',   '~> 3.2'

group :lint do
  gem 'foodcritic', '~> 4.0'
  gem 'rubocop', '~> 0.18'
  gem 'rainbow', '< 2.0'
  gem 'rake'
end

group :unit do
  gem 'chefspec',   '~> 4.2'
end

group :integration do
  gem 'test-kitchen',    github: 'test-kitchen/test-kitchen'
  gem 'kitchen-vagrant'
end
