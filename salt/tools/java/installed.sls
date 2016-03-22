java.repo:
  pkgrepo.managed:
    - humanname: Java8 Repo
    - name:  ppa:openjdk-r/ppa

old.removed:
  pkg.purged:
    - pkgs:
        - openjdk-7-jre
        - openjdk-7-jre-headless
        - openjdk-7-jdk

java.installed:
  pkg.installed:
    - pkgs:
      - openjdk-8-jdk
    - require:
      - pkg: old.removed
      - pkgrepo: java.repo
