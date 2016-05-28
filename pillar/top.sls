base:
  '*':
    - docker.repository
    - docker.registry.nginx
    - mine
  'minion1':
    - jenkins
  #'minion2':
  #  - nexus
