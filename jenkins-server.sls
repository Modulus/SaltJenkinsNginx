base:
  pkgrepo.managed:
    - humanname: Jenkins Repo
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - key_url: https://jenkins-ci.org/debian/jenkins-ci.org.key
    - file: /etc/apt/sources.list.d/jenkins.list

jenkins:
  pkg.installed:
    - pkgs:
      - jenkins
    - require:
      - pkgrepo: base
  service.running: 
    - enable: True
    - watch:
      - pkg: jenkins
