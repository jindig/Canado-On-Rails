class TodoItemsController < ApplicationController
  def index
  	@todo_list = TodoList.find(params[:todo_list_id])
  end

  def new
	@todo_list = TodoList.find(params[:todo_list_id])
  	@todo_item = @todo_list.todo_items.new
  end

  def create
  	@todo_list = TodoList.find(params[:todo_list_id])
  	@todo_item = @todo_list.todo_items.new(todo_item_params)
  	if todo_item.save
  		flash[:success] = "You added a new todo list item."
  		redirect_to todo_list_todo_items_path
  	else
  		flash[:error] = ":( - There was an error adding that todo list item. Try again!"
  		render action: :new
  	end
  end

  def edit
  	@todo_list = TodoList.find(params[:todo_list_id])
  	@todo_item = @todo_list.todo_items.find(params[:id])
  end

  def url_options
 	{ todo_list_id: params[:todo_list_id]}.merge(super)
  end

  private
  def todo_item_params
  	params[:todo_item].permit(:content)
  end

end
