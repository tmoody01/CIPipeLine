class jira {

  Exec {
    path => [ "/usr/bin", "/bin", "/usr/sbin"]
  }
  
   include jira::install
}