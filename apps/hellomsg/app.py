from flask import Flask, request, render_template

app = Flask(__name__)
messages = []


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        message = request.form['message']
        messages.append(message)
        return "Message '{}' added.".format(message)
    else:
        return render_template('index.html', messages=messages)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
