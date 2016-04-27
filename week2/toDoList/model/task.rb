class Task
	attr_reader :content, :id, :completed, :created_at
	@@current_id = 1
	def initialize content
			@content = content
			@id = @@current_id
			@completed = false
			@created_at = Time.new
			@updated_at = nil
			@@current_id += 1
	end

	def complete?
		@completed
	end

	def complete!
		@completed = true
	end

	def make_incomplete!
		@completed = false
	end

	def update_content! new_content
		@updated_at = Time.new
		@content = new_content
	end

end