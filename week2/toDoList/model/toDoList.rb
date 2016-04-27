require 'pry'


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
  		task_by_id
  	end
  end

  def sort_by_created
  	sorted_tasks = @tasks.sort_by do |task| 
  		task.created_at
  	end
  	sorted_tasks
  end

end

