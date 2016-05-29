base:
  '*':
    - hosts
  'G@roles:build':
    - build_server
    #- docker.registry
  'G@roles:repository':
    - docker.registry
