ALTER TABLE reserves
    ADD COLUMN client_id SMALLINT UNSIGNED,
    ADD CONSTRAINT FK_reserves_clients FOREIGN KEY(client_id)
        REFERENCES clients(client_id);