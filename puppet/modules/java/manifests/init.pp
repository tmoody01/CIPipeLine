class java{
  Exec {
    path => [ "/usr/bin", "/bin", "/usr/sbin"]
  }
  $java_location="http://10.50.20.18:8080/aaron/downloads/jdk-8u45-linux-x64.tar.gz"
  $java_home="/opt/jdk1.8.0_45/"
  
  include java::install
  include java::config
}