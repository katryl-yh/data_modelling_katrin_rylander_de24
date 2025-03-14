DESC;

CREATE TABLE IF NOT EXISTS Hospital (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    address VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Doctor (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS HospitalDepartment (
    hospital_department_id INT PRIMARY KEY,
    hospital_id INT,
    department_id INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE IF NOT EXISTS HospitalDoctor (
    hospital_doctor_id INT PRIMARY KEY,
    hospital_id INT,
    doctor_id INT,
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE IF NOT EXISTS DepartmentDoctor (
    department_doctor_id INT PRIMARY KEY,
    department_id INT,
    doctor_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);



