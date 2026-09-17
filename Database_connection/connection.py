import mysql.connector as sqlc

# Database connection
db_config = sqlc.connect(
    host="localhost",
    user="root",
    password="root",
    database="cricket"
)

print("Database connected successfully!")

# Create cursor
cursor = db_config.cursor()

# Create players table
table_creation_query = """
CREATE TABLE IF NOT EXISTS players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50),
    player_age TINYINT UNSIGNED,
    player_gender ENUM('Male', 'Female'),
    player_role ENUM('Batter', 'Bowler', 'Allrounder'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
"""

cursor.execute(table_creation_query)

print("Table created successfully!")


# Insert player data
# Insert player data
insert_query = """
INSERT INTO players
(player_name, player_age, player_gender, player_role)
VALUES (%s, %s, %s, %s)
"""

cursor.execute(insert_query, ("Rohit", 39, "Male", "Batter"))
cursor.execute(insert_query, ("Virat", 37, "Male", "Batter"))

db_config.commit()

print("Data inserted successfully!")


# Get player data
cursor.execute("SELECT * FROM players")

data = cursor.fetchall()

print("Player Data:")

for row in data:
    print(row)


# UPDATE
update_query = """
UPDATE players
SET player_age = %s
WHERE player_id = %s
"""
cursor.execute(update_query, (41, 1))
db_config.commit()
print("Player data updated successfully!")


# DELETE
delete_query = """
DELETE FROM players
WHERE player_id = %s
"""
cursor.execute(delete_query, (2,))
db_config.commit()
print("Player data deleted successfully!")


# Display data after DELETE
cursor.execute("SELECT * FROM players")
data = cursor.fetchall()

print("Final Player Data:")
for row in data:
    print(row)


# Close connection - MUST BE LAST
cursor.close()
db_config.close()