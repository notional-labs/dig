FROM faddat/sos-lite

COPY motd /etc/motd

COPY gaia.service /etc/systemd/system/dig.service


# Disk space thing
# Download starport, too
RUN sed -i -e "s/^CheckSpace/#!!!CheckSpace/g" /etc/pacman.conf && \
        # Dependencies & monitoring tools
        pacman -Syyu --noconfirm wget sudo go git dstat iotop nethogs && \
        # Install Gaia
	wget https://github.com/faddat/dig/raw/master/testnet-2/genesis.json && \
	git clone https://github.com/faddat/dig && \
	git checkout testnet-2 && \
	go mod download && \
	cd cmd/digd && \
	go install && \
        systemctl enable dig.service && \
	echo 'digd init pi$RANDOM' >> /usr/local/bin/firstboot.sh && \
	echo "cp /genesis.json /root/.dig/config/genesis.json" >> /usr/local/bin/firstboot.sh && \ 
        sed -i -e "s/^#!!!CheckSpace/CheckSpace/g" /etc/pacman.conf


# Add gaia user
RUN useradd gaia -m && \
	passwd -d gaia e
