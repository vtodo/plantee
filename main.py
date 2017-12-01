from pymongo import MongoClient
from os import environ
from datetime import datetime
import tornado.web
import logging
from bson.json_util import dumps

log = logging.getLogger("AppHandler")
log.setLevel(logging.DEBUG)
mongo = MongoClient(environ['MONGODB_URL'])
db = mongo['heroku_qrz1x7w8']

class DataHandler(tornado.web.RequestHandler):
    def get(self):
        self.write(dumps(db.plants.find()))
class AppHandler(tornado.web.RequestHandler):
    def get(self, _=None):
        self.render('dist/index.html', ip = self.request.remote_ip)
class InputHandler(AppHandler):
    def post(self):
        data = tornado.escape.json_decode(self.request.body)
        log.info(data)
        log.info(data['species'])
        db.plants.insert_one(data)
        self.write('yeah')

app = tornado.web.Application(handlers=[
    (r"/assets/(.*)", tornado.web.StaticFileHandler, {"path": "dist/assets/"}),
    (r"/js/(.*)", tornado.web.StaticFileHandler, {"path": "dist/js"}),
    (r"/css/(.*)", tornado.web.StaticFileHandler, {"path": "dist/css/"}),
    (r"/dumps", DataHandler),
    (r"/input", InputHandler),    
    (r"/(.*)", AppHandler)
])
