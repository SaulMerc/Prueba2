from flask import Flask
from flask_cors import CORS

from routes.product import product
from routes.user import user
from routes.comment import comment
from routes.car import car

def create_app():
    app = Flask(__name__)
    CORS(app)

    app.register_blueprint(product)
    app.register_blueprint(user)
    app.register_blueprint(comment)
    app.register_blueprint(car)

    return app
