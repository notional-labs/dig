FROM faddat/archlinux AS builder

ENV GOPATH /go
ENV PATH $PATH:/go/bin

RUN pacman -Syyu --noconfirm go base-devel

COPY . /dig

RUN cd /dig/cmd/digd && \
    go install .

FROM faddat/archlinux

ENV DIG_P2P_MAX_NUM_INBOUND_PEERS=500
ENV DIG_P2P_MAX_NUM_OUTBOUND_PEERS=60
ENV DIG_P2P_SEED_MODE=true

RUN pacman -Syyu --noconfirm 

COPY --from=builder /go/bin/digd /usr/bin/digd
COPY --from=builder /dig/networks/testnet-2/genesis.json /genesis.json

CMD /usr/bin/digd init busbar && cp /genesis.json /root/.dig/config/genesis.json && /usr/bin/digd start
