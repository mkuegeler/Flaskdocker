from flask import Flask
from flask_admin import Admin

app = Flask(__name__)

# set optional bootswatch theme
app.config['FLASK_ADMIN_SWATCH'] = 'cerulean'

admin = Admin(app, name='Flaskdocker', template_mode='bootstrap3')
# Add administrative views here


app.run(debug=True, host='0.0.0.0')