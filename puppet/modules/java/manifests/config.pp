class java::config
{
  file { '/etc/profile.d/java.sh':
    ensure => 'present',
	content => 'export JAVA_HOME=/opt/jdk1.8.0_45 \nexport JRE_HOME=/opt/jdk1.8.0_45/jre \nexport PATH=$PATH:$JAVA_HOME/bin :$JRE_HOME/bin',
	require => Exec['install_java'],
  }

}

