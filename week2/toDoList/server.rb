require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative "model/task"
require_relative "model/toDoList"


todo_list = TodoList.new("Josh")
todo_list.add_task Task.new("Walk the dog")
todo_list.add_task Task.new("Meditate")

get "/tasks" do 
	@tasks = todo_list.tasks
	erb(:task_index)
end

get "/new_task" do
	erb(:new_task)
end

post "/create_task" do
	new_task = Task.new params[:new_task]
  todo_list.add_task new_task
	redirect "/tasks" 
end

get "/complete_task/:id" do
	task_at_id = todo_list.find_task_by_id params[:id].to_i
	task_at_id.complete!
	redirect "/tasks"
end

get "/un_complete_task/:id" do
	task_at_id = todo_list.find_task_by_id params[:id].to_i
	task_at_id.make_incomplete!
	redirect "/tasks"
end

post "/purge_completed" do
	@tasks = todo_list.tasks
	@tasks.delete_if { |task| task.complete? == true }
	redirect "/tasks"
end