class maven::install(
  $sitelocation = "http://10.50.20.49:8080/aaron/downloads/apache-maven-3.3.3-bin.tar.gz",
  $version = "apache-maven-3.3.3",
  $str = "PATH=$PATH:%MAVEN_HOME%/opt/apache-maven-3.3.3/bin\nexport PATH",

){
  exec { 'download_maven':
    cwd     => '/opt',
    command => "wget ${sitelocation}",  	
    }
	
  exec { 'extract_maven':
    cwd     => '/opt',
	command => "tar zxvf ${version}-bin.tar.gz",
	require => Exec['download_maven'],
  }
  
  exec { 'install_maven':
    cwd => '/opt',
    command => "update-alternatives --install /usr/share/maven maven /opt/${version} 2",
    require => Exec['extract_maven'],
  }
  
  file { '/etc/profile.d/maven.sh':
    content => "$str",
	require => Exec['install_maven'],
  }
}