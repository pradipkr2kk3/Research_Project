CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    address VARCHAR(100)
);
=========================================================
CREATE TABLE education (
    education_id INT PRIMARY KEY,
    institute_name VARCHAR(150),
    degree VARCHAR(100),
    start_year INT,
    end_year INT,
    grade VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
=========================================================
CREATE TABLE skill (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(100),
    skill_category VARCHAR(100),
    description TEXT
);
==========================================================
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(150),
    company_type VARCHAR(100),
    company_location VARCHAR(150),
    company_email VARCHAR(100),
    company_contact VARCHAR(20)
);
=========================================================
CREATE TABLE experience (
    experience_id INT PRIMARY KEY,
    designation VARCHAR(100),
    role_description TEXT,
    joining_date DATE,
    end_date DATE,
    user_id INT,
    company_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);
============================================================
CREATE TABLE post (
    post_id INT PRIMARY KEY,
    post_content TEXT,
    post_date DATE,
    location VARCHAR(150),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
=============================================================
CREATE TABLE job (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    job_role VARCHAR(100),
    job_description TEXT,
    salary DECIMAL(10,2),
    jobpost_date DATE,
    skill_required VARCHAR(100),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);
===========================================================
CREATE TABLE job_application (
    application_id INT PRIMARY KEY,
    application_date DATE,
    application_status VARCHAR(50),
    user_id INT,
    job_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (job_id) REFERENCES job(job_id)
);
===========================================================
CREATE TABLE likes (
    user_id INT,
    post_id INT,
    like_status VARCHAR(20),
    liked_time TIMESTAMP,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id)
);
===========================================================
CREATE TABLE comments (
    user_id INT,
    post_id INT,
    comment_content TEXT,
    comment_time TIMESTAMP,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id)
);
===========================================================
CREATE TABLE share (
    user_id INT,
    post_id INT,
    share_content TEXT,
    share_time TIMESTAMP,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES post(post_id)
);
==========================================================
CREATE TABLE user_skill (
    user_id INT,
    skill_id INT,
    proficiency_level VARCHAR(50),
    years_of_experience INT,
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (skill_id) REFERENCES skill(skill_id)
);
===========================================================
