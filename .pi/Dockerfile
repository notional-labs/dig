FROM ghcr.io/faddat/sos-lite


COPY .pi/motd /etc/motd
COPY .pi/dig.service /etc/systemd/system/dig.service


# Disk space thing
# Download starport, too
RUN sed -i -e "s/^CheckSpace/#!!!CheckSpace/g" /etc/pacman.conf && \
        pacman -Syyu --noconfirm wget sudo git dstat iotop nethogs docker && \
	systemctl enable docker && \
	wget https://github.com/faddat/dig/releases/download/testnet-2/dig_latest_linux_arm64.tar.gz && \
	tar xvf dig_latest_linux_arm64.tar.gz && \
	mv digd /usr/bin && \
	mv airdrop /usr/bin && \
	echo 'digd init pi$RANDOM' >> /usr/local/bin/firstboot.sh && \
	echo 'docker run -d --net=host -v blurtd:/blurtd --restart=unless-stopped --name blurtd faddat/arm-blurt-presync /usr/bin/blurtd --data-dir /blurtd --plugin witness account_by_key account_by_key_api condenser_api database_api network_broadcast_api transaction_status transaction_status_api rc_api' >> /usr/local/bin/firstboot.sh && \ 
	echo "cp /digcode/networks/testnet-2/genesis.json /root/.dig/config/genesis.json" >> /usr/local/bin/firstboot.sh && \ 
	echo "systemctl enable dig.service" >> /usr/local/bin/firstboot.sh && \
        sed -i -e "s/^#!!!CheckSpace/CheckSpace/g" /etc/pacman.conf
