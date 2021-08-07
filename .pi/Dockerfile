FROM faddat/sos-lite

COPY .pi/motd /etc/motd
COPY .pi/dig.service /etc/systemd/system/dig.service
COPY . /digcode


# Disk space thing
# Download starport, too
RUN sed -i -e "s/^CheckSpace/#!!!CheckSpace/g" /etc/pacman.conf && \
        pacman -Syyu --noconfirm wget sudo go git dstat iotop nethogs docker && \
	systemctl enable docker && \
	cd digcode && \
	go mod download && \
	cd cmd/digd && \
	go install && \
	echo 'digd init pi$RANDOM' >> /usr/local/bin/firstboot.sh && \
	echo 'docker run -d --net=host -v blurtd:/blurtd --restart=unless-stopped --name blurtd faddat/arm-blurt-presync /usr/bin/blurtd --data-dir /blurtd --plugin witness account_by_key account_by_key_api condenser_api database_api network_broadcast_api transaction_status transaction_status_api rc_api' >> /usr/local/bin/firstboot.sh 
	echo "cp /digcode/networks/testnet-2/genesis.json /root/.dig/config/genesis.json" >> /usr/local/bin/firstboot.sh && \ 
	echo "systemctl enable dig.service" >> /usr/local/bin/firstboot.sh && \
        sed -i -e "s/^#!!!CheckSpace/CheckSpace/g" /etc/pacman.conf
