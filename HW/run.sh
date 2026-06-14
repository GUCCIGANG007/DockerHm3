#!/bin/bash

DATA_DIR="$(pwd)/data"
mkdir -p "$DATA_DIR"

case "$1" in
  build_generator)
    docker build -f Dockerfile.generator -t generator .
    echo " Generator образ собран"
    ;;

  run_generator)
    docker run --rm -v "$DATA_DIR:/data" generator
    echo " data.csv создан"
    ;;

  build_reporter)
    docker build -f Dockerfile.reporter -t reporter .
    echo " Reporter образ собран"
    ;;

  run_reporter)
    docker run --rm -v "$DATA_DIR:/data" reporter
    echo " report.html создан"
    ;;

  create_local_data)
    mkdir -p local_data && python3 generate.py local_data
    echo " Локальный тест"
    ;;

  *)
    echo "Команды:"
    echo "  ./run.sh build_generator"
    echo "  ./run.sh run_generator"
    echo "  ./run.sh build_reporter"
    echo "  ./run.sh run_reporter"
    ;;
esac
