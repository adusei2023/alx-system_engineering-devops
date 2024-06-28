#!/usr/bin/pup
# Install an especific version of flask (2.1.0)
exec { 'install_flask_werkzeug':
  command => '/usr/bin/pip3 install Flask==2.1.0 Werkzeug==2.1.*',
  unless  => '/usr/bin/python3 -c "import flask, werkzeug; print(flask.__version__, werkzeug.__version__)" | grep -q "2.1.0 2.1."',
  path    => ['/bin', '/usr/bin'],
}

