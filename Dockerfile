FROM quay.io/roboll/helmfile:v0.61.1

# install aws cli
RUN apk --update add python curl
RUN curl "https://bootstrap.pypa.io/get-pip.py" | python && pip install awscli

# install kubectl
RUN curl -o /usr/local/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/kubectl && chmod +x /usr/local/bin/kubectl

# additionl helm plugins
RUN helm init --client-only
RUN helm plugin install https://github.com/rimusz/helm-tiller

CMD ["/usr/local/bin/helmfile"]
