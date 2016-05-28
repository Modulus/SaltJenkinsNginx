include:
  - docker
  - docker.registry.nginx
  
pull.registry:
  dockerng.image_present:
    - name: registry:2
    - require:
      - pkg: docker.installed


run.docker.registry:
  dockerng.running:
    - image: registry:2
    - port_bindings:
      - 5000:5000
    - require:
      - dockerng: pull.registry
