FROM nixos/nix

MAINTAINER aaryamannchallani7@gmail.com

# Bread and Butter
RUN apk update && apk upgrade && \
    apk add --no-cache bash git

# Python setup
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Node setup
RUN apk add --update nodejs nodejs-npm
RUN apk add yarn

# Busybox setup
RUN apk add -u busybox

# Other useful tools
RUN apk add bash-doc bash-completion
RUN apk --no-cache add curl

# Dapp-tools setup
WORKDIR /app
COPY install.sh .
RUN ./install.sh

ENTRYPOINT ["sleep", "infinity"]
