class jira {
  Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/']
  }
  $jira_location ="http://10.50.20.18:8080/aaron/downloads/atlassian-jira-6.4.9-x64.bin"
  
  include jira::install
}