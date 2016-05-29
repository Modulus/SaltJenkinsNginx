include:
  - docker
  - docker.registry.nginx

extend:
  docker.installed:
    service.running:
      - name: docker
      - watch:
        - file: copy.etc.default.docker

pull.registry:
  dockerng.image_present:
    - name: registry:2.4.1
    - require:
      - pkg: docker.installed


run.docker.registry:
  dockerng.running:
    - image: registry:2.4.1
    - name: registry
    - port_bindings:
      - 5000:5000
    - require:
      - dockerng: pull.registry

copy.etc.default.docker:
  file.managed:
    - name: /etc/default/docker
    - source: salt://docker/conf/default
    - require:
      - pkg: docker.installed
