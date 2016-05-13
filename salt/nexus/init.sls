include:
  - python
  - docker

pull down nexus docker image:
  dockerng.image_present:
    - name: sonatype/nexus3


start nexus container:
  dockerng.running:
    - image: sonatype/nexus3
    - name: nexus3
    - port_bindings:
      - "8081:8081"
    - restart_policy: always
    - require:
      - dockerng: pull down nexus docker image
#      - docker: create nexus3 volume container

#create nexus3 volume container:
#  dockerng.volume_present:
#    - name: nexus3-data
