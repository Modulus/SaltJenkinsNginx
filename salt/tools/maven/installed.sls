maven.installed:
  pkg.installed:
    - pkgs:
      - maven
    - require:
      - pkg: java.installed
