class ListsController < ApplicationController
  def index
    @lists = List.all   # shows all lists
    render :index
  end

  def show
    @list = List.find(params[:id]) # finds id of a single list
    render :show
  end

  def new
    @list = List.new # initialize the list model
    render :new
  end

  def create
    @list = List.new(list_params) #generates a new list object with the parameters returned from the list_params method.
    if @list.save
      respond_to do |format|
        format.html { redirect_to lists_path }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id]) #we do NOT need to use strong parameters. We can safely pull the id from the params.
    render :edit
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

# needed for create and update - needs to be on bottom
  private #Strong parameters use a private method to permit only designated parameters to be passed for our model. Therefore, any malicious request sent with malicious parameters will not successfully process since the private method can not be accessed.
    def list_params
      params.require(:list).permit(:name, :author, :description) #example of multiple fields
    end




end
