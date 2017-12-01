import tornado.web
import tornado.websocket
import logging
import json

log = logging.getLogger("AppHandler")
log.setLevel(logging.DEBUG)

cl = []
class AppHandler(tornado.web.RequestHandler):
    def get(self):
        log.info("Main")
        self.render('dist/index.html', ip = self.request.remote_ip, clients = len(cl))
    
class SocketHandler(tornado.websocket.WebSocketHandler):
    def check_origin(self, origin):
        return True
    
    def on_message(self, message):
        for c in cl:
            c.write_message(message)

    def open(self):
        if self not in cl:
            log.info("Opened connection")
            self.write_message("User joined")
            cl.append(self)

    def on_close(self):
        log.info("Closed connection")
        if self in cl:
            cl.remove(self)

app = tornado.web.Application(handlers=[
    (r"/", AppHandler),
    (r"/ws", SocketHandler),
    (r"/assets/(.*)", tornado.web.StaticFileHandler, {"path": "dist/assets/"}),
    (r"/js/(.*)", tornado.web.StaticFileHandler, {"path": "dist/js"}),
    (r"/css/(.*)", tornado.web.StaticFileHandler, {"path": "dist/css/"})
])
