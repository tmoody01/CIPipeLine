class java::install{
  exec{ 'download_java':
   cwd => '/opt/',
   command => "wget ${java::java_location}",
    }
   
   exec { 'unzip_java':
    cwd => '/opt/',
	command => 'tar zxvf jdk-8u45-linux-x64.tar.gz',
	creates => "${java::java_home}",
	require => Exec['download_java'],
   }
   
   exec { 'install_java':
    cwd => "${java::java_home}",
	command => 'update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_45/bin/java 2',
	require => Exec['unzip_java'],
   }
      
}