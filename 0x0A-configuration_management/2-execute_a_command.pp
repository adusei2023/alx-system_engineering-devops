exec { 'kill killmenow':
  command => 'pkill killmenow',
  path    => ['/bin', '/usr/bin'], # Ensure the path to pkill is included
  onlyif  => 'pgrep killmenow',    # Ensure the process is running before attempting to kill it
}

