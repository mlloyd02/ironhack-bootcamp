class Post
	attr_reader :title, :date, :content, :author, :category

	def initialize(title, date, content, author, category)
		@title = title
		@date = date
		@content = content
		@author = author
		@category = category
	end

	def angry_title
		@title.upcase + "!!!"
	end

end
