class maven {
  Exec {
    path => ['/usr/bin','/bin','/usr/sbin']
  }
  
  include maven::install
}