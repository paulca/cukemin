class <%= plural_class_name %>Controller < ApplicationController
  def index
    @<%= plural_name %> = <%= model_name %>.paginate(:page => params[:page])
  end

  def new
    @<%= singular_name %> = <%= model_name %>.new
  end
  
  def create
    @<%= singular_name %> = <%= model_name %>.new(params[:<%= singular_name %>])
    if @<%= singular_name %>.save
      redirect_to <%= plural_path_helper %>_path
    else
      render :new
    end
  end
  
  def edit
    @<%= singular_name %> = <%= model_name %>.find(params[:id])
  end
  
  def update
    @<%= singular_name %> = <%= model_name %>.find(params[:id])
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to <%= plural_path_helper %>_path
    else
      render :edit
    end
  end
  
  def destroy
    @<%= singular_name %> = <%= model_name %>.find(params[:id])
    @<%= singular_name %>.destroy
    redirect_to <%= plural_path_helper %>_path
  end
end