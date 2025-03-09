-- I want info on Sjukhusstock and its departments
-- hospital_department can join with department table on department_id and hospital table on hospital_id
-- query name from hospital table and name from department table

SELECT h.name AS hospital_name, d.name AS department_name
FROM main.Department d
INNER JOIN main.HospitalDepartment hd 
    ON d.department_id = hd.department_id 
INNER JOIN main.Hospital h
    ON h.hospital_id = hd.hospital_id 
WHERE h.name = 'Sjukhusstock';
