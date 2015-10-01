lass nexus::config
{
  file { '/etc/profile.d/nexus.sh':
    ensure => 'present',
	content => 'export NEXUS_HOME=/opt/nexus-2.11.1-01 \n PATH=$PATH:$NEXUS_HOME/bin,
	require => Exec['install_nexus'],
  }

}

