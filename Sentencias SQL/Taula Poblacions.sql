USE db_hotels;

ALTER TABLE poblacions

	ADD COLUMN provincia_id SMALLINT UNSIGNED
			AFTER poblacio_id,
    ADD CONSTRAINT FK_poblacions_provincies FOREIGN KEY (provincia_id)
			REFERENCES provincies (provincia_id);