
require 'rspec-puppet'

###
### Ref:
###   http://www.jedi.be/blog/2011/12/05/puppet-unit-testing-like-a-pro/
###

RSpec.configure do |c|
  c.module_path  = File.expand_path(File.join(File.dirname(__FILE__), '../../modules'))
  c.manifest_dir = File.expand_path(File.join(File.dirname(__FILE__), '../../../manifests'))
end

# vim:ft=ruby:

