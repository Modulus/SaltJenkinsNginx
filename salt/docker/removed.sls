docker.dependencies.purged:
  pkg.purged:
    - pkgs: 
      - apt-transport.https
      - ca-certificates

#For ubuntu 14.x LTS
docker.repository.absent:
  pkgrepo.absent:
    - name: deb https://apt.dockerproject.org/repo ubuntu-trusty main
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D

docker.purged:
  pkg.purged:
    - name: docker-engine
    - require:
      - service: docker.service.disabled
      - pkgrepo: docker.repository.absent
      - pkg: docker.dependencies.purged
   
docker.service.disabled:
  service.disabled:
    - name: docker-engine



