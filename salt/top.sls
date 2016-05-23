base:
  '*':
    - hosts
  'G@roles:build':
    - build_server
  'G@roles:repository':
    - docker.registry
