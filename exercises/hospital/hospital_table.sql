CREATE SCHEMA IF NOT EXISTS hospital_ex1;

SET search_path TO hospital_ex1;

CREATE TABLE IF NOT EXISTS Hospital (
    hospital_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL
);



CREATE TABLE IF NOT EXISTS Department (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Doctor (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- SELECT * FROM hospital_ex1.hospital; 

CREATE TABLE IF NOT EXISTS HospitalDepartment (
    hospital_id INTEGER NOT NULL ,
    department_id INTEGER NOT NULL ,
    FOREIGN KEY (hospital_id) REFERENCES hospital_ex1.hospital (hospital_id),
    FOREIGN KEY (department_id) REFERENCES hospital_ex1.department (department_id)
);

CREATE TABLE IF NOT EXISTS DepartmentDoctor (
    department_id INTEGER NOT NULL ,
    doctor_id INTEGER NOT NULL ,
    FOREIGN KEY (department_id) REFERENCES hospital_ex1.department (department_id),
    FOREIGN KEY (doctor_id) REFERENCES hospital_ex1.doctor (doctor_id)
);

CREATE TABLE IF NOT EXISTS HospitalDoctor (
    hospital_id INTEGER NOT NULL ,
    doctor_id INTEGER NOT NULL ,
    FOREIGN KEY (hospital_id) REFERENCES hospital_ex1.hospital (hospital_id),
    FOREIGN KEY (doctor_id) REFERENCES hospital_ex1.doctor (doctor_id)
);

