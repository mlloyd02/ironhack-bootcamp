require 'sinatra'
require 'sinatra/reloader'

require_relative "./models/post.rb"
require_relative "./models/blog.rb"

blog = Blog.new
blog.add_post Post.new("John's Post", Time.new(2016, 4, 3), "Today was great!", "John", "inspiration")
blog.add_post Post.new("Just Another Day", Time.new(2016, 4, 2), "Today was amazing!", "John Jr.", "fiction")
blog.add_post Post.new("Yet Another Day", Time.new(2016, 4, 1), "My life is awesome!", "Juan", "horror-fantasy-romance")


get "/" do
	@posts = blog.latest_posts
	erb(:posts)		
end

get "/post_details/:index" do
	index = params[:index].to_i
	post_at_i = blog.latest_posts[index]
	@title_at_i = post_at_i.title
	@date_at_i = post_at_i.date.strftime("%m/%d/%Y")
	@content_at_i = post_at_i.content
	@author_at_i = post_at_i.author
	@category_at_i = post_at_i.category
	erb(:post_details)
end

get "/new_post" do
  erb(:new_post)
end

post "/submit_post" do
	new_title = params[:title]
  new_content = params[:content]
  new_author = params[:author]
  new_category = params[:category]
  new_post = Post.new(new_title, Time.new, new_content, new_author, new_category)
  blog.add_post new_post
  redirect "/"
end