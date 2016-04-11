base:
  '*':
    - docker.repository
  'minion1':
    - server.build
    - letsencrypt 
  'minion2':
    - server.web
