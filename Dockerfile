FROM klakegg/hugo:ext-ubuntu

RUN apt-get update \
    && apt-get install git -y \
    && apt-get install curl -y \
    &&curl -OL https://go.dev/dl/go1.19.2.linux-amd64.tar.gz \
    && mkdir /opt/go && tar -C /opt/go -xvf go1.19.2.linux-amd64.tar.gz

ENV GOPATH=/opt/go/go
ENV PATH="${PATH}:/opt/go/go/bin"

RUN go install github.com/jackyzha0/hugo-obsidian@latest \
    && cd /opt \
    && git clone https://github.com/jackyzha0/quartz.git

WORKDIR '/opt/quartz'

ENTRYPOINT ["/bin/bash", "-c" , "hugo-obsidian -input=content -output=assets/indices -index=true -root=. && hugo --destination=public && hugo server"]