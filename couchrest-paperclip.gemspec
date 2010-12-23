# encoding: utf-8

Gem::Specification.new do |gem|

  gem.name        = 'couchrest-paperclip'
  gem.version     = '0.0.1'
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = 'Mark Ellul'
  gem.email       = 'mark.ellul+gems@gmail.com'
  gem.homepage    = 'https://github.com/meskyanichi/mongoid-paperclip'
  gem.summary     = 'CouchRest::Paperclip enables you to use Paperclip with the CouchRest ODM for CouchDB.'
  gem.description = 'CouchRest::Paperclip enables you to use Paperclip with the CouchRest ODM for CouchDB'

  gem.files         = %x[git ls-files].split("\n")
  gem.test_files    = %x[git ls-files -- {spec}/*].split("\n")
  gem.require_path  = 'lib'
  
  gem.add_dependency 'paperclip', ['~> 2.3.6']

end