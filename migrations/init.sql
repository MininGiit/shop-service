CREATE TABLE merch (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cost INT NOT NULL
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE coins (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    balance INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE transaction_coins (
    id INT PRIMARY KEY,
    from_user_id INT NOT NULL,
    to_user_id INT NOT NULL,
    amount INT NOT NULL CHECK,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_user_id) REFERENCES Users(id),
    FOREIGN KEY (to_user_id) REFERENCES Users(id)
);

CREATE TABLE purchases (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    merch_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (merch_id) REFERENCES merch(id)
);

INSERT INTO merch (name, cost) VALUES
    ('t-shirt', 80),
    ('cup', 20),
    ('book', 50),
    ('pen', 10),
    ('powerbank', 200),
    ('hoody', 300),
    ('umbrella', 200),
    ('socks', 10),
    ('wallet', 50),
    ('pink-hoody', 500)