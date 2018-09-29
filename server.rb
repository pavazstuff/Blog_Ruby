require 'sinatra'
require 'haml'
require 'sqlite3'

class Blog
	def initialize()
		@db = SQLite3::Database.open('blog.sqlite')
	end

	def posts()
		self.post_array_to_hash(@db.execute("SELECT * FROM posts"))
	end

	def new_post(title, body)
		@db.execute("INSERT INTO posts(title, body) VALUES('#{title}','#{body}')")
		@db.last_insert_row_id()
	end

	def post(id)
		self.post_array_to_hash(@db.execute("SELECT * FROM posts WHERE id = #{id}"))[0]
	end

	def post_array_to_hash(arr)
		arr.map do |post|
			{
				:id => post[0],
				:title => post[1],
				:body => post[2],
				:timestamp => post[3]
			}
		end
	end
end

db = Blog.new()
pw = "1234"

get '/' do
	@posts = db.posts()
	haml :index
end

get '/post/:id' do
	@post = db.post(params[:id])
	haml :post
end

get '/post' do
	haml :nuevo
end

post '/post' do
	if params[:password] == pw then
		id = db.new_post(params[:title],params[:body])
		redirect "/post/#{id}"
	else
		#"Access DENIED !!, Get OUT Here. Only developer manager proyect."
		redirect "/"
	end
end

get '/about' do 
	haml :about
end