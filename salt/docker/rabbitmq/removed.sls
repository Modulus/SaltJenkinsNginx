rabbitmq.stopped:
  dockerng.stopped:
    - containers:
      - rabbitmq.start
    - require_in:
      - rabbitmq.removed

rabbitmq.container.removed:
  dockerng.absent:
    - names:
      - rabbitmq.start
    - require_in:
      - rabbitmq.removed


rabbitmq.removed:
  dockerng.image_absent:
    - name: rabbitmq
