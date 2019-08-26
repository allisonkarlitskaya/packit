# pip3 install packit from this repo.
# To build packit image on docker hub.

FROM fedora:30

RUN dnf -y install ansible

ENV ANSIBLE_STDOUT_CALLBACK=debug

COPY files/tasks/*.yaml /files/tasks/
COPY files/install-requirements.yaml /files/
COPY *.spec .

RUN ansible-playbook -v -c local -i localhost, /files/install-requirements.yaml
RUN pip3 install .

WORKDIR /src
