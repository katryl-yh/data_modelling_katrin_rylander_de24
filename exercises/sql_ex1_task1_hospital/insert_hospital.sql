SET search_path TO hospital_ex1;

INSERT INTO hospital_ex1.hospital (name, address)
VALUES
    (
        'Sjukhusstock',
        'Drottninggatan 3'
    ),
    (
        'Sjukhussoder',
        'Sodergatan 3'
    );

SELECT * FROM hospital_ex1.hospital;

