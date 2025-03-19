SET search_path TO hospital_ex1;

--DELETE FROM hospital_ex1.department WHERE name = 'Neurologi' ;

TRUNCATE TABLE hospital_ex1.department RESTART IDENTITY CASCADE;

INSERT INTO hospital_ex1.department (name)
VALUES
    (
        'Kardiologi'
    ),
    (
        'Neurologi'
    ),
    (
        'Gynekologi'
    );

SELECT * FROM hospital_ex1.department;
