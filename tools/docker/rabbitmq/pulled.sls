include:
  - tools.docker.installed

rabbitmq.pull:
  dockerng.image_present:
    - name: rabbitmq
    - require_in:
      - dockerng: rabbitmq.start
    - require:
      - pkg: docker.installed

rabbitmq.start:
  dockerng.running:
    - image: rabbitmq
    - ports:
      - 4369
      - 5671
      - 5672
      - 25672
    - port_bindings:
      - 4369:4369
      - 5671:5671
      - 5672:5672
      - 25672:25672
