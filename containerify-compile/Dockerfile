FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      autoconf \
      build-essential \
      avahi-daemon libavahi-client-dev \
      libssl-dev libkrb5-dev libnss-mdns libpam-dev \
      libsystemd-dev libusb-1.0-0-dev zlib1g-dev \
      ca-certificates \
      curl \
      vim \
      git \
      procps \
	iproute2 \
    && rm -rf /var/lib/apt/lists/*
     

# cups-client \

#COPY cupsd.conf /etc/cups/cupsd.conf

# Allow remote access (optional-ish). Adjust to your needs.
#RUN sed -i \
#      -e 's/^Listen .*/Listen 0.0.0.0:10631\nServerName foo/' \
#      -e 's/^Browsing .*/Browsing Off/' \
#      /etc/cups/cupsd.conf \
# && sed -i 's/^WebInterface .*/WebInterface Yes/' /etc/cups/cupsd.conf \
# && printf '\n<Location />\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf \
# && printf '\n<Location /admin>\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf \
# && printf '\n<Location /admin/conf>\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf
WORKDIR /build
RUN git clone https://github.com/OpenPrinting/cups
WORKDIR /build/cups
RUN ./configure --enable-debug --enable-debug-printfs
RUN make
RUN make install
COPY cupsd.conf /usr/local/etc/cups/cupsd.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#EXPOSE 10631

VOLUME ["/etc/cups", "/var/spool/cups", "/var/log/cups"]

ENTRYPOINT ["/entrypoint.sh"]

