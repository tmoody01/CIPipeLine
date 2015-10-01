class nexus {
 Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/']
  }
  
$nexus_location="http://download.sonatype.com/nexus/oss/nexus-2.11.1-01-bundle.tar.gz"

include nexus::install
}