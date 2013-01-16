
class groups::app {

    group { 'app':
        ensure     => present,
        gid        => '1000',
        allowdupe  => true,
    }

}

# vim:ft=puppet

