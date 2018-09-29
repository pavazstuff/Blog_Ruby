require 'sqlite3'

db = SQLite3::Database.open('blog.sqlite')

#db.execute <<SQL	
#SQL 

db.execute("DELETE FROM posts WHERE id=7");
db.execute("DELETE FROM posts WHERE id=6");
db.execute("DELETE FROM posts WHERE id=5");
