class jira::install {
 
 exec { 'download_jira':
  cwd => '/opt/',
  command => 'wget http://10.50.20.18:8080/aaron/downloads/atlassian-jira-6.4.9-x64.bin',
 }
 
 exec { 'chmod_jira':
  cwd => '/opt/',
  command => 'chmod a+x atlassian-jira-6.4.9-x64.bin',
  require => Exec['download_jira'],
 }
 
 exec { 'response_jira':
  command => 'printf "o\n1\ni\n"',
  require => Exec['chmod_jira'],
 }
 
}