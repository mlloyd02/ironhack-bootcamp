require "rspec"
require "./toDoList"

describe Task do

	before :all do
		@task = Task.new("Buy the milk")
	end

	describe "complete?" do
		it "returns false for a new task" do
      expect(@task.complete?).to eq(false)
    end
	end

	describe "complete!" do
		it "changes task's completed attribute to true" do
			expect(@task.complete!).to eq(true)
		end
	end

	describe "make_incomplete!" do
		it "changes task's completed attribute to false" do
			expect(@task.make_incomplete!).to eq(false)
		end
	end

	describe "update_content!" do
		it "returns a new given value for content" do
			expect(@task.update_content!("Buy Mac Cheese")).to eq("Buy Mac Cheese")
		end
	end

	# describe "update_content!" do
	# 	it "saves a time into the updated_at variable" do
	# 		expect(@task.updated_at).should_not eq(nil)
	# 	end
	# end
end

describe TodoList do

	before :all do
		@task = Task.new("Buy the milk")
		@list = TodoList.new
	end

	describe "add_task" do
		it "adds a task to the task array" do
			expect(@list.add_task(@task)).to eq([@task])
		end
	end

	describe "find_task_by_id" do
		it "returns the content of a given id" do
			expect(@list.find_task_by_id(2)).to eq("Buy the milk")
		end
	end

	describe "find_task_by_id" do
		it "returns nil if given id is not found" do
			expect(@list.find_task_by_id(10)).to eq(nil)
		end
	end

	describe "delete_task" do
		it "deletes a task from the task array" do
			expect(@list.delete_task(2)).to eq([])
		end
	end

	

end


