FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      cups \
      cups-client \
      libcups2 \
      ca-certificates \
      curl \
      vim \
    && rm -rf /var/lib/apt/lists/*

# Allow remote access (optional-ish). Adjust to your needs.
RUN sed -i \
      -e 's/^Listen .*/Listen 0.0.0.0:10631\nServerName foo/' \
      -e 's/^Browsing .*/Browsing Off/' \
      /etc/cups/cupsd.conf \
 && sed -i 's/^WebInterface .*/WebInterface Yes/' /etc/cups/cupsd.conf \
 && printf '\n<Location />\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf \
 && printf '\n<Location /admin>\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf \
 && printf '\n<Location /admin/conf>\n  Order allow,deny\n  Allow all\n</Location>\n' >> /etc/cups/cupsd.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#EXPOSE 10631

VOLUME ["/etc/cups", "/var/spool/cups", "/var/log/cups"]

ENTRYPOINT ["/entrypoint.sh"]

