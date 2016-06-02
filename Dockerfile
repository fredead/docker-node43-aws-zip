FROM node:4.3

RUN apt-get update && apt-get install -y python-pip zip && pip install awscli
RUN mkdir -p ~/.ssh
ADD ssh_config ~/.ssh/config
RUN chmod 0600 ~/.ssh/config
ADD aws-s3-kms-decrypt.sh /bin/aws-s3-kms-decrypt.sh
RUN chmod a+x /bin/aws-s3-kms-decrypt.sh



