FROM nginx

RUN apt-key adv --fetch-keys http://swupdate.openvpn.net/repos/repo-public.gpg

RUN echo "deb http://swupdate.openvpn.net/apt jessie main" > /etc/apt/sources.list.d/openvpn.list

RUN apt-get update -y

RUN apt-get install -y \
  openvpn \
  easy-rsa

COPY nginx.conf /etc/nginx/nginx.conf

COPY nginx.ovpn /etc/openvpn/nginx.conf

CMD ["bash", "-c", "openvpn --config /etc/openvpn/nginx.conf & nginx -g 'daemon off;'"]
