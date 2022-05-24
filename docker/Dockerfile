FROM python:2.7

RUN apt-get update -y && apt-get install -y vim sshpass git

WORKDIR /app

#copy scripts and requirements
COPY requirements.txt /app/
COPY down.sh /app/
COPY setup.sh /app/
COPY run.sh /app/
COPY check.sh /app/

#install python dependencies
RUN python -mpip install --trusted-host pypi.python.org -r requirements.txt

#clone cloudera ansible installation repository
RUN git clone https://github.com/javierdallamore/cloudera.cluster.git
RUN cd cloudera.cluster && git checkout cdp-wws

#install ansible dependencies
RUN cd cloudera.cluster && ansible-galaxy collection install -r requirements.yml
RUN cd cloudera.cluster && ansible-galaxy role install -r requirements.yml

RUN ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa

CMD ["tail", "-f", "/dev/null"]
