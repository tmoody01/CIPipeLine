class nexus::install {
  
  exec { 'download_nexus':
  
  cwd => '/usr/local',
  command => "wget ${nexus::nexus_location}",
  
  }
  
  exec { 'unzip_nexus':
  
  cwd => '/usr/local',
  command => 'tar zxvf nexus-2.11.1-01-bundle.tar.gz',
  require => Exec['download_nexus'],
  }
  
  exec { 'link_nexus':
   
   cwd => '/usr/local',
   command => 'ln -s nexus-2.11.1-01 nexus',
   require => Exec['unzip_nexus'],
   
 }
  exec { 'adduser_nexus':
  
  cwd => '/usr/local/nexus',
  command => 'printf "user\n\n\n\n\nY\n" | sudo adduser -disabled-password -disabled-login nexus',
  require => Exec['link_nexus'],
  
  }
  exec { 'chown_nexus':
  
  cwd => '/usr/local/nexus',
  command => 'chown -R nexus:nexus /usr/local/nexus-2.11.1-01/',
  require => Exec['adduser_nexus'],
  }
  
  exec { 'chownsona_nexus':
  
  cwd => '/usr/local/nexus',
  command => 'chown -R nexus:nexus /usr/local/sonatype-work/',
  require => Exec['chown_nexus'],
  }
   exec { 'chmod_nexus':
  cwd => '/usr/local/nexus/bin',
  command => 'chmod a+x nexus',
  require => Exec['chownsona_nexus'],
 }
  exec { 'run_nexus':
  cwd => '/usr/local/nexus',
  command => 'su nexus -c "./bin/nexus start"',
  require => Exec['chmod_nexus'],
  }
}