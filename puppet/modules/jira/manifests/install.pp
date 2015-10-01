class jira::install {
 
 exec { 'download_jira':
  cwd => '/opt/',
  command => "wget ${jira::jira_location}",
  timeout =>  '0',
 }
 
 exec { 'chmod_jira':
  cwd => '/opt/',
  command => 'chmod a+x atlassian-jira-6.4.9-x64.bin',
  require => Exec['download_jira'],
 }
 
 exec { 'run_jira':
  cwd => '/opt/',
  command => 'printf "o\n1\ni\n" | sudo ./atlassian-jira-6.4.9-x64.bin',
  require => Exec['chmod_jira'],
  timeout => '0',
 }
 
 
}