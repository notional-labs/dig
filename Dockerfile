FROM ghcr.io/faddat/sos/sos-lite AS builder

ENV GOPATH /go
ENV PATH $PATH:/go/bin

RUN pacman -Syyu --noconfirm go

COPY . /dig

RUN cd /dig

FROM ghcr.io/faddat/sos/sos-lite

COPY --from=builder /go/bin/digd /usr/bin/digd
COPY --from=builder /dig/networks/testnet-2/genesis.json /genesis.json
