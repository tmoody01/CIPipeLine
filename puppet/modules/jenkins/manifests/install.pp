class jenkins::install(
  $sitelocation = "http://pkg.jenkins-ci.org/redhat/jenkins.repo",
  $version = "",
){
  exec { 'download_jenkins':
    command => 'wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -',  	
    }
	
  exec { 'echo_jenkins':
    command => "sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'",
	require => Exec['download_jenkins'],
  }
  
  exec { 'update_jenkins':
    command => 'apt-get update',
	require => Exec['echo_jenkins'],
  }
  
  package { 'package_jenkins':
    ensure  => installed,
	require => Exec['update_jenkins'],
  }
   
  service { 'service_jenkins':
    ensure  => running,
	require => Package['package_jenkins'],
  }
  
  file_line { 'change_port_jenkins':
    path   => '/etc/default/jenkins',
	line   => 'HTTP_PORT=8081',
    match  => '^HTTP_PORT=',
	notify => Service['service_jenkins'],
	require  => Package['package_jenkins'],
  }
  
} # end class

