-- Hospital
INSERT INTO Hospital VALUES (1, 'Sjukhusstock', 'Drottninggatan 3');

-- Department 
INSERT INTO Department VALUES (1, 'Kardiologi');
INSERT INTO Department VALUES (2, 'Neurologi');

-- Doctor
INSERT INTO Doctor VALUES (1, 'Dr. Abra Abrahamson');
INSERT INTO Doctor VALUES (2, 'Dr. Erika Eriksson');
INSERT INTO Doctor VALUES (3, 'Dr. Sven Svensson');

-- HospitalDepartment
INSERT INTO HospitalDepartment VALUES (1, 1, 1);
INSERT INTO HospitalDepartment VALUES (2, 1, 2);

-- HospitalDoctor
INSERT INTO HospitalDoctor VALUES (1, 1, 1);
INSERT INTO HospitalDoctor VALUES (2, 1, 2);
INSERT INTO HospitalDoctor VALUES (3, 1, 3);

-- DepartmentDoctor
INSERT INTO DepartmentDoctor VALUES (1, 1, 1);
INSERT INTO DepartmentDoctor VALUES (2, 1, 2);
INSERT INTO DepartmentDoctor VALUES (3, 2, 3);


