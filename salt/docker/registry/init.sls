include:
  - docker
 # - docker.registry.nginx

#extend:
 # docker.installed:
#    service.running:
#      - name: docker
      #- watch:
        #- file: copy.etc.local.docker

pull.registry:
  dockerng.image_present:
    - name: registry:2
    - require:
      - pkg: docker.installed


run.docker.registry:
  dockerng.running:
    - image: registry:2
    - name: registry
    - port_bindings:
      - 5000:5000
    - require:
      - dockerng: pull.registry
      #- file: copy.etc.local.docker

#copy.etc.local.docker:
#  file.managed:
#    - name: /etc/default/docker
#    - source: salt://docker/conf/local
#    - require:
#      - pkg: docker.installed
