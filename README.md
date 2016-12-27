# Raspberry Pi Server PoC

A quick proof of concept that a server (will be a Raspberry Pi) can be used as
an upstream server behind a VPN (OpenVPN in this case) from another server (planning on using DigitalOcean). This circumvents having
to use any Dynamic DNS or revealing a home IP address 😱.

## Dependencies

This example runs using `docker` and `docker-compose`. It supposes that the
Raspberry Pi will be using `docker` to connect to the OpenVPN host.

## How to test

1.  Run the setup:

    ```bash
    ./setup.sh
    ```

2.  Follow the instructions and type in passwords where necessary.

3.  Run the containers:

    ```bash
    docker-compose up --build -d
    ```

4.  Try to see if you get back a file directory from the `raspberrypi`
    containers:

    ```bash
    curl -H 'Host: raspberrypi.local' localhost
    ```

    > If you'd like to curl from a different port than the default 80, change
    > the `ports` under `nginx` inside of `docker-compose.yml`.
    >
    > Want to try it in a browser? Add `raspberrypi.local` to your `/etc/hosts`
    > file, and point it to `127.0.0.1`.

    The response should look something like the following:

    ```html
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><html>
    <title>Directory listing for /</title>
    <body>
    <h2>Directory listing for /</h2>
    <hr>
    <ul>
    <li><a href=".dockerenv">.dockerenv</a>
    <li><a href="bin/">bin/</a>
    <li><a href="boot/">boot/</a>
    <li><a href="dev/">dev/</a>
    <li><a href="etc/">etc/</a>
    <li><a href="home/">home/</a>
    <li><a href="lib/">lib/</a>
    <li><a href="lib64/">lib64/</a>
    <li><a href="media/">media/</a>
    <li><a href="mnt/">mnt/</a>
    <li><a href="opt/">opt/</a>
    <li><a href="proc/">proc/</a>
    <li><a href="root/">root/</a>
    <li><a href="run/">run/</a>
    <li><a href="sbin/">sbin/</a>
    <li><a href="srv/">srv/</a>
    <li><a href="sys/">sys/</a>
    <li><a href="tmp/">tmp/</a>
    <li><a href="usr/">usr/</a>
    <li><a href="var/">var/</a>
    </ul>
    <hr>
    </body>
    </html>
    ```

6.  As a negative test, try the following:

    ```bash
    curl localhost
    ```

    That should return a 404 like below:

    ```html
    <html>
    <head><title>404 Not Found</title></head>
    <body bgcolor="white">
    <center><h1>404 Not Found</h1></center>
    <hr><center>nginx/1.11.7</center>
    </body>
    </html>
    ```
