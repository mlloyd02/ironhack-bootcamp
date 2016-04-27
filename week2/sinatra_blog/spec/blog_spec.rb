require 'rspec'
require_relative '../models/blog.rb'
require_relative '../models/post.rb'

RSpec.describe Blog do

	before :each do
		@blog = Blog.new
		@post1 = Post.new("John's Post", Time.new(2016, 4, 6), "Today was great!")
		@post2 = Post.new("Just Another Day", Time.new(2016, 4, 5), "Today was amazing!")
		@post3 = Post.new("Yet Another Day", Time.new(2016, 4, 6), "My life is awesome!")
	end
	
	it "#lastest_post returns an array of posts" do
		expect(@blog.posts).to eq( [] )
	end

end