include:
  - tools.docker.installed

pull.docker.registry:
  dockerng.running:
    - image: distribution/registry
    - require:
      -pkg: docker.installed
