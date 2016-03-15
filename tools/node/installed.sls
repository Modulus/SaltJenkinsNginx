node.installed:
  pkg.installed:
    - pkgs:
      - nodejs-legacy
      - npm

bower:
  npm.installed:
    - require:
      - pkg: node.installed

gulp:
  npm.installed:
    - require:
      - pkg: node.installed
      - npm: bower
