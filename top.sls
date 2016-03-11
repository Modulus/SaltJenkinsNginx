base:
  '*':
    - tools.maven.installed
    - jenkins.installed
    - nginx.installed-secure-ssl
    - ssh.generate_keys
    - tools.docker.installed
