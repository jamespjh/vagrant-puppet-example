from flask import Flask, jsonify

application = Flask(__name__)

@application.route('/<int:number>')
def double(number):
    return jsonify({'result': number*2})

if __name__ == '__main__':
    application.run(debug=True)
