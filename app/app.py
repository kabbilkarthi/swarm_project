from flask import Flask, render_template, request, redirect, url_for, jsonify, abort
from database import about_me, about_customer_insert, about_customer_fetch, about_project, about_certification
import os

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/owner_details')
def owner_details():
    info = about_me()  # Fetch user details from the database
    return render_template('owner_details.html', owner_details=info[0])

@app.route('/handle_choice', methods=['POST'])
def handle_choice():
    choice = request.form.get('choice')
    if choice == 'yes':
        return redirect(url_for('customer_details'))
    else:
        return redirect(url_for('bye'))
    
@app.route('/project_details')
def project_details():
    info = about_project()  # Fetch user details from the database
    return render_template('project_details.html', project_details=info)

@app.route('/certification_details')
def certification_details():
    info = about_certification()  # Fetch user details from the database
    return render_template('certification_details.html', certification_details=info)

@app.route('/api/all') 
def api_all():
    return jsonify({
        "owner": about_me(),
        "projects": about_project(),
        "certifications": about_certification()
    })

@app.route('/api/owner')
def api_owner():
    return jsonify(about_me())

@app.route('/api/projects')
def api_projects():
    return jsonify(about_project())

@app.route('/api/certifications')
def api_certifications():
    return jsonify(about_certification())

@app.route('/api/customers')
def api_customers():
    api_key = request.headers.get("x-api-key")
    if api_key != os.getenv("API_KEY"):   
        abort(401, description="Invalid API Key") 
    return jsonify(about_customer_fetch())

@app.route('/customer_details')
def customer_details():
    return render_template('customer_details.html')

@app.route('/submit_customer_details', methods=['POST'])
def submit_customer_details():
    name = request.form.get('name')
    email = request.form.get('email')
    user_type = request.form.get('user_type', 'Visitor') 
    # Save to database
    about_customer_insert(name, email, user_type)
    return render_template('result.html')

@app.route('/bye')
def bye():
    return render_template('bye.html')

if __name__ == '__main__':
    # Only run Flask’s dev server if not inside Docker
    if os.getenv("FLASK_ENV") == "development":
        app.run(host='0.0.0.0', port=5000, debug=True)
