CREATE DATABASE cricket;
SHOW DATABASES;

USE cricket;

ALTER TABLE players
ADD COLUMN gender VARCHAR(10),
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DESCRIBE players;
SELECT * FROM players;
DELETE FROM players;

DELETE FROM players
WHERE id IN (2, 3);
SELECT * FROM players;

use cricket;
drop table if exists players;

USE cricket;

SELECT * FROM players;

SELECT * FROM players
WHERE player_id = 2;

SELECT * FROM players
WHERE player_id = 1;
