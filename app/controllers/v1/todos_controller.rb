module V1
	class TodosController < ApplicationController
		before_action :set_todo, only: %i[show update destroy]

		# GET /todos
		def index
			# Get current user todos
			@todos = current_user.todos.paginate(page: params[:page], per_page: 20)
			json_response(@todos)
		end

		# POST /todos
		def create
			# Create todos belonging to current user
			@todo = current_user.todos.create!(todo_params)
			json_response(@todo, :created)
		end

		# GET /todos/:id
		def show
			json_response(@todo)
		end

		# PUT /todos/:id
		def update
			@todo.update(todo_params)
			head :no_content
		end

		# DELETE /todos/:id
		def destroy
			@todo.destroy
			head :no_content
		end

			private

		# Remove 'created_by' from list of permitted parameters
		def todo_params
			# Whitelist params
			params.permit(:title)
		end

		def set_todo
			@todo = Todo.find(params[:id])
		end
	end
end
