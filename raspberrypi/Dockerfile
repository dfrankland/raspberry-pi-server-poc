FROM debian:jessie

RUN apt-key adv --fetch-keys http://swupdate.openvpn.net/repos/repo-public.gpg

RUN echo "deb http://swupdate.openvpn.net/apt jessie main" > /etc/apt/sources.list.d/openvpn.list

RUN apt-get update -y

RUN apt-get install -y \
  openvpn \
  easy-rsa \
  python \
  curl

COPY raspberrypi.ovpn /etc/openvpn/raspberrypi.conf

EXPOSE 8000

CMD ["bash", "-c", "openvpn --config /etc/openvpn/raspberrypi.conf & python -m SimpleHTTPServer"]
