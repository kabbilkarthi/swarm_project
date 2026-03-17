from sqlalchemy import create_engine, text
import os
import urllib.parse

def read_secret(path):
    try:
        with open(path) as f:
            return f.read().strip()
    except Exception:
        raise Exception(f"Missing secret: {path}")

db_user = read_secret("/run/secrets/db_user")
db_pass = read_secret("/run/secrets/db_pass")
db_host = "db"
db_name = read_secret("/run/secrets/db_name")

engine = create_engine(
    f"mysql+pymysql://{db_user}:{db_pass}@{db_host}/{db_name}?charset=utf8mb4",
    pool_pre_ping=True,
    pool_recycle=1800,
    pool_size=5,
    max_overflow=10
    )

def about_me():
    with engine.connect() as conn: 
        result = conn.execute(text("SELECT * FROM about_me"))
        about_me = []
        for row in result.all():
            about_me.append(dict((row)))
    return about_me
    
def about_customer_insert(name, email, user_type="Visitor"):
    with engine.begin() as conn:  # begins a transaction and auto-commits
        query = text("INSERT INTO about_customer (name, email, user_type) VALUES (:name, :email, :user_type)")
        conn.execute(query, {"name": name, "email": email, "user_type": user_type})

def about_customer_fetch():
    with engine.connect() as conn: 
        result = conn.execute(text("SELECT * FROM about_customer"))
        about_customer = []
        for row in result.all():
            about_customer.append(dict((row)))
    return about_customer
    
def about_project():
    with engine.connect() as conn: 
        result = conn.execute(text("SELECT * FROM about_project"))
        about_project = []
        for row in result.all():
            about_project.append(dict((row)))
    return about_project

def about_certification():
    with engine.connect() as conn: 
        result = conn.execute(text("SELECT * FROM about_certification"))
        about_certification = []
        for row in result.all():
            about_certification.append(dict((row)))
    return about_certification
 
