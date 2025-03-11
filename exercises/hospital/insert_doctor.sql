SET search_path TO hospital_ex1;

-- TRUNCATE TABLE hospital_ex1.department RESTART IDENTITY CASCADE;

INSERT INTO hospital_ex1.doctor (name)
VALUES
    (
        'Dr. Abra Abrahamson'
    ),
    (
        'Dr. Erika Eriksson'
    ),
    (
        'Dr. Sven Svensson'
    ),
    (
        'Dr. Carl Carlsson'
    ),
    (
        'Dr. Anna Karlsson'
    ),
    (
        'Dr. Sara Lindgren'
    );

SELECT * FROM hospital_ex1.doctor;