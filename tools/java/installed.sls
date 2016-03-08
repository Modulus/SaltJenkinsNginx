java-repo:
  pkgrepo.managed:
    - humanname: Java8 Repo
    - name:  ppa:openjdk-r/ppa

java.installed:
  pkg.installed:
    - pkgs:
      - openjdk-8-jdk
    - require:
      - pkgrepo: java-repo
