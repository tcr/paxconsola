#!/usr/local/bin/python3.9

import http.server
import urllib
import socketserver
import socket
import os
import sys
import re

PORT = 8000

console = sys.argv[1]
consoles = ["c64", "dos", "gameboy"]
if console not in consoles:
    print(f"Expected one of {consoles}, got {console}")
    sys.exit(1)

f = open(sys.argv[2], "rb")
DUMMY_RESPONSE = f.read()
f.close()


class ServerHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, directory=None, **kwargs):
        curdir = os.path.dirname(os.path.realpath(__file__))
        super().__init__(*args, **kwargs, directory=curdir)

    def do_GET(self):
        if re.match(r"^/(index\.html)?(\?.*)?$", self.path):
            self.send_response(303)
            self.send_header("Location", f"/{console}/")
            self.end_headers()
            return

        if self.path.startswith("/local.bin"):
            self.send_response(200)
            self.send_header("Content-type", "application/octet-stream")
            self.send_header("Content-length", len(DUMMY_RESPONSE))
            self.end_headers()
            self.wfile.write(DUMMY_RESPONSE)
            return

        http.server.SimpleHTTPRequestHandler.do_GET(self)


class MyTCPServer(socketserver.TCPServer):
    def server_bind(self):
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind(self.server_address)


with MyTCPServer(("", PORT), ServerHandler) as httpd:
    print(f"Open http://0.0.0.0:{PORT}/")
    httpd.serve_forever()
