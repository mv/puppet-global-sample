
class icinga::api {

# require icinga
  require icinga::params

  # notify apache 'service'
# include apache::install

  package { 'icinga-api':
    ensure  => installed,
    name    => $icinga::params::pkg_api,
  }

  ###
  ### Directories,files
  ###

  File { owner => 'icinga', group => 'icinga', require => Package['icinga-api'] }

  ### Directories
  file {'/var/log/icinga/api':
    ensure => directory ,
    owner  => 'icinga',
    group  => 'icingacmd',
    mode   => '2775',
  }

  ### Files
  file {'/usr/share/icinga/icinga-api': recurse => true , mode => '0664' }

  ### rpm -qlv icinga-api
  ###     icinga-1.6.1   {
  # rpm -qlv icinga-api | awk '{print $1,$3,$4,$9}' | column -t
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/IcingaApi.php
  # drwxr-xr-x  icinga  icinga    /usr/share/icinga/icinga-api/contrib
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/contrib/ido2dbparser
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/contrib/ido2dbparser/Ido2dbParser.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/IcingaApiConstantsInterface.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/command
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommand.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandCollection.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandDispatcher.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandSend.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandSendPipe.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/command/IcingaApiCommandSendSsh.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnection.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnectionDatabase.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnectionFile.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnectionIdo.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnectionInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/connection/IcingaApiConnectionLivestatus.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/conversion
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/conversion/IcingaApiConversionTime.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug/debugTargets
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug/debugTargets/icingaApiDebuggerTargetInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug/debugTargets/icingaApiEchoDebugger.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug/debugTargets/icingaApiFileDebugger.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/debug/icingaApiDebugger.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/ociPDO
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/ociPDO/PDO
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/ociPDO/PDO/ociPDO.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/ociPDO/PDO/ociPDOStatement.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/ociPDO/icingaApiPDO.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/result
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/result/IcingaApiResult.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/result/IcingaApiResultFile.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/result/IcingaApiResultIdo.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/result/IcingaApiResultInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/result/IcingaApiResultLivestatus.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/search
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearch.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearchColumnsFile.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearchFile.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearchIdo.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearchInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/IcingaApiSearchLivestatus.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchIdoInterface.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchIdoMysql.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchIdoOci.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchIdoOci8.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchIdoPgsql.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/data_interfaces/IcingaApiSearchLivestatusSocket.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter/IcingaApiSearchFilter.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter/IcingaApiSearchFilterGroup.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter/IcingaApiSearchFilterGroupIdo.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter/IcingaApiSearchFilterIdo.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/objects/search/filter/IcingaApiSearchFilterInterface.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/tests
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/icingaApiTests.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/apiSearchDefinitions
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/apiSearchDefinitions/custom.ini
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/apiSearchDefinitions/icinga-web.ini
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/apiSearchDefinitions/objectsearch.ini
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/dbConfig.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/idoConnectionTest.php
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/idoCreateSearchTest.php
  # drwxrwxr-x  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/mysql_delete.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/mysql_dump.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/mysql_schema.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/oci8_delete.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/oci8_schema.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/oracle_dump.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testDatabases/pgsql.sql
  # -rw-rw-r--  icinga  icinga    /usr/share/icinga/icinga-api/tests/idoTests/testSuite.php
  # drwxrwsr-x  icinga  icingacm  /var/log/icinga/api
  # }

} # class

# vim:ft=puppet:

