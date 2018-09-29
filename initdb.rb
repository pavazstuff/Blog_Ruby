require 'sqlite3'

if File.exists? "blog.sqlite"
	File.delete("blog.sqlite")
end

db = SQLite3::Database.open('blog.sqlite')

db.execute <<SQL
	CREATE TABLE posts(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		title VARCHAR(255),
		body TEXT,
		timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
		);
SQL 

db.execute <<SQL
	INSERT INTO posts (title, body)
	VALUES ("null","null");
SQL

db.execute <<SQL
	INSERT INTO posts (title, body)
	VALUES ("Mi primer posts","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
SQL

db.execute <<SQL
	INSERT INTO posts (title, body)
	VALUES ("Mi segundo posts","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
SQL

db.execute <<SQL
	INSERT INTO posts (title, body)
	VALUES ("Mi tercer posts","Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
SQL
