-- Create database
CREATE DATABASE IF NOT EXISTS self_site;
USE self_site;

-- ========================
-- Table: about_me
-- ========================
DROP TABLE IF EXISTS about_me;
CREATE TABLE about_me (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    email VARCHAR(255)
);

INSERT INTO about_me (id, name, description, email) VALUES
(1, 'Kabbil', 'I started out as a Mechanical Engineer, but life had other plans — and tech quickly became my true calling.
I’m Kabbil, a curious mind who loves solving problems and pushing boundaries. Over time, I’ve specialized in Linux Administration and grown into the world of Site Reliability Engineering (SRE) and DevOps.  
Alongside scripting in Python and Bash, I work with Docker, Kubernetes, and automation tools like Ansible.  
I’m also exploring CI/CD pipelines, monitoring, and infrastructure as code to build scalable and reliable systems.  
For me, technology isn’t just about uptime — it’s about creating systems that are resilient, automated, and efficient.  
Always exploring, always learning — and if you’d like to connect, please reach out to me on LinkedIn 
https://www.linkedin.com/in/kabbil or mail me at', 'g.i.kabbil@gmail.com');

-- ========================
-- Table: about_customer
-- ========================
DROP TABLE IF EXISTS about_customer;
CREATE TABLE about_customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    user_type VARCHAR(50)
);

INSERT INTO about_customer (id, name, email, user_type) VALUES
(1, 'sasikala s', 'sasikala@gmail.com', 'Visitor');

-- ========================
-- Table: about_certification
-- ========================
DROP TABLE IF EXISTS about_certification;
CREATE TABLE about_certification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(500)
);

INSERT INTO about_certification (id, name, url) VALUES
(1, 'Microsoft Certified: DevOps Engineer Expert', 'https://learn.microsoft.com/en-us/users/kabbilgi-1299/credentials/certification/devops-engineer?tab=credentials-tab'),
(2, 'Red Hat Certified Engineer (RHCE)', 'https://www.credly.com/badges/f7cd4672-d21a-4971-84c5-f794cddb99f3/linked_in_profile'),
(3, 'Microsoft Certified: Azure Administrator Associate', 'https://learn.microsoft.com/en-us/users/kabbilgi-1299/credentials/certification/azure-administrator?tab=credentials-tab'),
(4, 'Red Hat Certified System Administrator (RHCSA)', 'http://credly.com/badges/98926449-21cb-4f9d-a9f1-d27259d52fb3/public_url'),
(5, 'Microsoft Certified: Azure Fundamentals', 'https://www.credly.com/badges/270052c3-e480-4695-958a-058bc049a75b?source=linked_in_profile'),
(6, 'MTA: Introduction to Programming Using Python - Certified 2021', 'http://credly.com/badges/1afd523a-c7a4-4f10-92ec-09fc5b2af040/public_url'),
(7, 'Code Yourself! An Introduction to Programming', 'https://www.coursera.org/account/accomplishments/verify/HN9ENTQLEVF4');

-- ========================
-- Table: about_project
-- ========================
DROP TABLE IF EXISTS about_project;
CREATE TABLE about_project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    url VARCHAR(500)
);

INSERT INTO about_project (id, name, description, url) VALUES
(1, 'Personal Portfolio Website', 'I built my own website using Python, leveraging the Flask framework to power both the front-end and back-end. For data storage and management, I integrated a MySQL database. This project was a valuable learning experience, as it allowed me to explore new tools and technologies such as HTML, CSS, and database design for the first time. Successfully completing it gave me the confidence and excitement of truly feeling like a software developer.', ''),
(2, 'Azure DevOps Project', 'This project automates the setup and deployment of Grafana and Prometheus using Ansible and Docker, integrated with Azure DevOps pipelines. The setup includes configuring Node Exporter on target hosts, setting up SSL certificates and configuring Azure DNS zones, and deploying containers using Docker Compose.', 'https://github.com/kabbilkarthi/Azure-DevOps'),
(3, 'DevOps Project Using Jenkins Pipeline', 'This project sets up a Grafana and Prometheus monitoring stack running inside Docker containers using docker-compose. It also includes Node Exporter for system metrics collection and Jenkins for automating the build and deployment processes. The Jenkins agent node also serves as the Ansible control node for configuring and deploying services.', 'https://github.com/kabbilkarthi/DevOps'),
(4, 'Data Extraction and Manipulation', 'I implemented data collection and processing using Python scripts, which automated workflows and reduced manual effort. This solution helped the team save time', 'https://github.com/kabbilkarthi/Python'),
(5, 'NAS share Mounting', 'This script manages NAS (Network Attached Storage) configurations on remote hosts by checking existing NFS (Network File System) shares and optionally creating new ones. It operates by connecting to each host listed in the /var/host file, verifying connectivity, and performing the necessary actions.', 'https://github.com/kabbilkarthi/linux/tree/main/NAS_Mount');

