SET search_path TO ezecream_05;

INSERT INTO Customer (first_name, last_name, email, address)
VALUES
    (
        'Ragnar',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    ),
    (
        'Lagertha',
        'Lothbrok',
        'lagertha@kattegat.com',
        '2 Shieldmaiden Road'
        
    ),
    (
        'Bjorn',
        'Ironside',
        'bjorn@kattegat.com',
        '3 Viking Bay'
        
    ),
    (
        'Ivar',
        'the Boneless',
        'ivar@danes.com',
        '4 The Great Heathen Army Camp'
        
    );

SELECT
    *
FROM
    ezecream_05.customer;


INSERT INTO ezecream_05.Customer (customer_id, first_name, last_name, email, address)
VALUES
    (
        50,
        'Ubbe',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    );

SELECT
    *
FROM
    ezecream_05.customer;

-- DELETE FROM ezecream_05.customer WHERE customer_id = 5;

-- TODO: for reader find out how to delete a customer with ID = 50;