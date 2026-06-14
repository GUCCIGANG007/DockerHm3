#!/bin/bash

DATA_DIR="$(pwd)/data"
mkdir -p "$DATA_DIR"

case "$1" in
  build_generator)
    docker build -f Dockerfile.generator -t generator .
    echo "Образ generator успешно собран"
    ;;
  run_generator)
    docker run --rm -v "$DATA_DIR":/data generator
    echo "Контейнер выполнен — data/data.csv создан на хосте"
    ;;
  create_local_data)
    mkdir -p local_data && python3 generate.py local_data
    echo "Локальный тест выполнен"
    ;;
  *)
    echo "Использование:"
    echo "  ./run.sh build_generator"
    echo "  ./run.sh run_generator"
    echo "  ./run.sh create_local_data"
    ;;
esac
