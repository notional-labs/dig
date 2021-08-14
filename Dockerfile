FROM faddat/archlinux AS builder

ENV GOPATH /go
ENV PATH $PATH:/go/bin

RUN pacman -Syyu --noconfirm go base-devel

COPY . /dig

RUN cd /dig/cmd/digd && \
    go install .

FROM faddat/archlinux

RUN pacman -Syyu --noconfirm 

COPY --from=builder /go/bin/digd /usr/bin/digd
COPY --from=builder /dig/networks/testnet-2/genesis.json /genesis.json
