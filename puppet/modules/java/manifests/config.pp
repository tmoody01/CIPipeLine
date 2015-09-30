class java::config (
  $environment_path = "export JAVA_HOME=/opt/jdk1.8.0_45\nexport JRE_HOME=/opt/jdk1.8.0_45/jre\nexport PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin"
)

{
  file { '/etc/profile.d/java.sh':
    ensure => 'present',
	content => $environment_path,
	require => Exec['install_java'],
  }

}

