ARG BASE_IMAGE=fedora:30
FROM ${BASE_IMAGE}

RUN yum -y upgrade && \
  yum -y install \
  fedpkg \
  redhat-rpm-config \
  rpmdevtools \
  rpm-build

# Create a testing user.
RUN useradd -m tester
WORKDIR /work
COPY . .
RUN chown -R tester:tester /work

USER tester
