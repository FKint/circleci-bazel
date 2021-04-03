# Docker container for Bazel on CircleCI

Simple docker container installing Bazel and a default JRE in a standard CircleCI container.

* Building: `DOCKER_VERSION=4.0.0; docker build -t fkint/circleci-bazel:$DOCKER_VERSION --build-arg bazel_version=$DOCKER_VERSION .`