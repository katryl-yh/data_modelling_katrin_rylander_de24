SET search_path TO hospital_ex1;

-- TRUNCATE TABLE hospital_ex1.department RESTART IDENTITY CASCADE;

INSERT INTO hospital_ex1.hospitaldepartment (hospital_id,department_id )
VALUES
    (
        1,1
    ),
    (
        1,2
    ),
    (
        2,1
    ),
    (
        2,2
    ),
    (
        2,3
    );

SELECT * FROM hospital_ex1.hospitaldepartment;

TRUNCATE TABLE hospital_ex1.departmentdoctor RESTART IDENTITY CASCADE;

INSERT INTO hospital_ex1.hospitaldoctor (hospital_id, doctor_id )
VALUES
    (
        1,1
    ),
    (
        1,2
    ),
    (
        1,3
    ),
    (
        1,6
    ),
    (
        2,3
    ),
    (
        2,4
    ),
    (
        2,5
    ),
    (
        2,6
    );

SELECT * FROM hospital_ex1.hospitaldoctor;

INSERT INTO hospital_ex1.departmentdoctor (department_id, doctor_id )
VALUES
    (
        1,1
    ),
    (
        1,6
    ),
    (
        2,2
    ),
    (
        2,3
    ),
    (
        2,4
    ),
    (
        3,5
    ),
    (
        3,6
    );

SELECT * FROM hospital_ex1.departmentdoctor;