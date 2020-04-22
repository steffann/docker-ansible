FROM debian:stretch
WORKDIR /playbooks
ENV LANG C.UTF-8

RUN apt update \
    && apt install -y python3 python3-pip git ssmtp mailutils \
    && echo root:ansible@isp.solcon.nl:mx101.solcon.nl >> /etc/ssmtp/revaliases \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install ansible==2.8.5 jmespath ncclient netaddr ruamel.yaml PyNaCl cryptography python-netbox ansible-tower-cli \
    && rm -rf /root/.cache
