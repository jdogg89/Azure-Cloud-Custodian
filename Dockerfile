FROM python:3.6.6-slim-stretch
WORKDIR /tmp
ENV PATH="/root/bin/:/tmp/:${PATH}"
COPY requirements.txt execution.sh ./
RUN apt-get --yes update \
 && apt-get --yes upgrade \
 && apt-get --yes install git \
 && pip install --no-cache-dir -r requirements.txt \
 && git clone https://github.com/capitalone/cloud-custodian.git ./cloud-custodian \
 && pip install ./cloud-custodian \
 && pip install ./cloud-custodian/tools/c7n_azure \
 && pip install ./cloud-custodian/tools/c7n_mailer
CMD ["/bin/bash", "/tmp/execution.sh"]
