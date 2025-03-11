-- I want info on Sjukhusstock and its departments
-- hospital_department can join with department table on department_id and hospital table on hospital_id
-- query name from hospital table and name from department table

SET search_path TO hospital_ex1;

SELECT 
    *
FROM hospital_ex1.department d
LEFT JOIN hospital_ex1.hospitaldepartment hd 
    ON d.department_id = hd.department_id 
LEFT JOIN hospital_ex1.hospital h
    ON h.hospital_id = hd.hospital_id;

SELECT 
    *
FROM hospital_ex1.department d
LEFT JOIN hospital_ex1.hospitaldepartment hd 
    ON d.department_id = hd.department_id 
LEFT JOIN hospital_ex1.hospital h
    ON h.hospital_id = hd.hospital_id 
WHERE h.name = 'Sjukhusstock';

SELECT 
    d.name AS department_name,
    h.name AS hospital_name
FROM hospital_ex1.department d
LEFT JOIN hospital_ex1.hospitaldepartment hd 
    ON d.department_id = hd.department_id 
LEFT JOIN hospital_ex1.hospital h
    ON h.hospital_id = hd.hospital_id;

SELECT 
    d.name AS department_name,
    h.name AS hospital_name,
    doc.name AS doctor_name
FROM hospital_ex1.department d
LEFT JOIN hospital_ex1.hospitaldepartment hd 
    ON d.department_id = hd.department_id 
LEFT JOIN hospital_ex1.hospital h
    ON h.hospital_id = hd.hospital_id
LEFT JOIN hospital_ex1.hospital 
    ON h.hospital_id = hd.hospital_id
LEFT JOIN hospital_ex1.departmentdoctor ddoc
    ON d.department_id = ddoc.department_id
LEFT JOIN hospital_ex1.doctor doc
    ON doc.doctor_id = ddoc.doctor_id
WHERE h.name = 'Sjukhusstock';