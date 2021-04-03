ARG bazel_version

FROM cimg/base:stable
USER root
# Install bazel and a standard JRE (for maven repository rules).
RUN apt-get update && apt-get install -y apt-transport-https curl gnupg && \
    curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg && \
    mv bazel.gpg /etc/apt/trusted.gpg.d/ && \
    echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && apt-get install -y default-jre bazel:$bazel_version && \
    rm -rf /var/lib/apt/lists/*

RUN bazel --version