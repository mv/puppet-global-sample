# Puppet Global


Global manifests for puppet.


## Dir Structure

    git_clone_dir/
      |
      +- config/deploy/      # capistrano deploy stuff
      +- config/deploy.rb
      +- Capfile
      |
      +- hiera/              # hiera: hierarchy based configs
      |
      +- manifests/site.pp   # my simple site.pp
      +- modules/            # the real deal !!!  <<<---- **
      |
      +- test/               # test: Jenkins CI scritps
      |   +- check_lint.sh        # recursively calling puppet-lint
      |   +- check_syntax.sh      # recursively checking *.pp syntax
      |   +- check_erb.sh         # recursively checking *.erb syntax
      |   +- provision-vagrant.sh # POC: start a centos62 box and provision 'base'
      |   +- jenkins-jobs/        # jenkins config.xml
      |
      +- Vagrantfile ->      # .gitignoreD! link this to your own vagrantfile
      +- vagrantfile-single  # a single box
      +- vagrantfile-multi   # master/node1 boxes
      |
      +- README.md           # this file


## Conventions

For each new module you must provide at least the following files:

    modules/class_name/README.md
    modules/class_name/manifests/init.pp
    modules/class_name/manifests/params.pp
    modules/class_name/manifests/install.pp
    modules/class_name/manifests/remove.pp

For modules artifacts inside __files/__ or __templates/__ you do not need to
provide extra subdirectories. Example:

**Correct:**

    modules/class_name/files/hosts
    modules/class_name/files/service
    modules/class_name/files/my.conf

**Wrong:**

    modules/class_name/files/
               etc/hosts
               etc/init.d/service
               etc/my.conf


## Usage

Manifests may be tested either masterless or in client/server mode.

A _*Gemfile*_ is provided so to keep correct working versions.
To use it:

    bundle install --binstubs


### Testing manifests: masterless

    vagrant up  node1
    vagrant ssh node1
    puppet -e 'include mondule_name'

### Testing master/server

    vagrant up
    vagrant ssh master # or
    vagrant ssh node1


## References

    https://github.com/jordansissel/puppet-examples/tree/master/masterless
    https://github.com/jordansissel/puppet-examples/tree/master/nodeless-puppet
    http://semicomplete.com/presentations/puppet-at-loggly/puppet-at-loggly.pdf.html

___
Marcus Vinicius Ferreira
2012-02

