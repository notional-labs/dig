FROM faddat/sos-lite

COPY .pi/motd /etc/motd
COPY .pi/dig.service /etc/systemd/system/dig.service
COPY . /digcode


# Disk space thing
# Download starport, too
RUN sed -i -e "s/^CheckSpace/#!!!CheckSpace/g" /etc/pacman.conf && \
        # Dependencies & monitoring tools
        pacman -Syyu --noconfirm wget sudo go git dstat iotop nethogs && \
	cd digcode && \
	go mod download && \
	cd cmd/digd && \
	go install && \
	echo 'digd init pi$RANDOM' >> /usr/local/bin/firstboot.sh && \
	echo "cp /digcode/networks/testnet-2/genesis.json /root/.dig/config/genesis.json" >> /usr/local/bin/firstboot.sh && \ 
	echo "systemctl enable dig.service" >> /usr/local/bin/firstboot.sh && \
        sed -i -e "s/^#!!!CheckSpace/CheckSpace/g" /etc/pacman.conf
