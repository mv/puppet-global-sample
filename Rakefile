
require 'rake'
require 'rspec/core/rake_task'
require 'puppet-lint'

desc "All tests: rspec + lint"
task :all do
  Rake::Task["lint"].invoke
  Rake::Task["spec"].invoke
end

###
### puppet-lint
###
task :default => :lint

desc "Run lint check on puppet manifests"
task :lint do

  linter = PuppetLint.new
  linter.configuration.send('disable_80chars')
  linter.configuration.send('disable_documentation')
  linter.configuration.log_format = 'Lint: %{path} - %{kind}: %{message} on line %{linenumber}'

  # ignoring "modules/{_archived,_todo,_...}"
  Dir['**/*.pp'].reject{ |f| f[%r{modules/_}] }.each do |pp|
    linter.file = pp
    linter.run
    puts "Lint: #{pp} - OK" if not linter.warnings? || linter.errors?
  end

  # exit error, so I can use it in Jenkins
  fail if linter.errors?
  fail if linter.warnings?

  puts 'Lint: OK'

end


###
### Test: rspec
###
desc "Run specs check on puppet manifests"
RSpec::Core::RakeTask.new(:spec) do |t|

  t.rspec_opts = "--color "
# t.rspec_opts = "--color --format documentation"
# t.pattern = './demo-puppet/modules/**/*_spec.rb' # don't need this, it's default
  t.pattern = 'modules/*/spec/**/*_spec.rb'
# t.verbose = true

  puts 'Rspec: OK'

end

# vim:ft=ruby:

