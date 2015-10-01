class jenkins {
  Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
  }
  include jenkins::install
}