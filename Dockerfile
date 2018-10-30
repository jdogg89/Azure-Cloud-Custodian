FROM python:3.6.6-slim-stretch
WORKDIR /tmp
ENV PATH="/root/bin/:${PATH}"
ENV PATH="/tmp/:${PATH}"
COPY requirements.txt execution.sh ./
RUN apt-get --yes update \
 && apt-get --yes upgrade \
 && pip install --no-cache-dir -r requirements.txt \
 && pip install c7n \
 && pip install c7n_azure \
 && pip install c7n_mailer
CMD ["/bin/bash", "/tmp/execution.sh"]

