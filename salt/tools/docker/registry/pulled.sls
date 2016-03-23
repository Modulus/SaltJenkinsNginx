include:
  - tools.docker.installed

pull.registry:
  dockerng.image_present:
    - name: registry:2

run.docker.registry:
  dockerng.running:
    - image: registry:2
    - port_bindings:
      - 5000:5000
    - require:
      - dockerng: pull.registry
      - pkg: docker.installed
