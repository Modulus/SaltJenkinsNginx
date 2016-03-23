sbt-repo:
  pkgrepo.managed:
    - humanname: Jenkins Repo
    - name: deb https://dl.bintray.com/sbt/debian /
    - keyserver: hkp://keyserver.ubuntu.com:80
    - keyid: 642AC823
    - file: /etc/apt/sources.list.d/jenkins.list

scala.installed:
  pkg.installed:
    - name: scala
    - require:
      - pkg: java.installed

sbt.installed:
  pkg.installed:
    - name: sbt
    - require:
      - pkg: java.installed
      - pkg: scala.installed
      - pkgrepo: sbt-repo
