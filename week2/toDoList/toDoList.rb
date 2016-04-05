class Task
	attr_reader :content, :id
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

class TodoList
  attr_reader :tasks
  def initialize user
      @tasks = []
      @user = user
  end

  def add_task new_task
  	@tasks << new_task
  end

  def delete_task id
  	@tasks.delete_if { |task| task.id == id }
  end

  def find_task_by_id id
  	task_by_id = @tasks.find do |task|
  		task.id == id
  	end
  	if task_by_id == nil
  		nil
  	else
  		task_by_id.content
  	end
  end

  def sort_by_created
  end

end



