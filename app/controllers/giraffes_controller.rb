class GiraffesController < ApplicationController
   before_action :authorize_user, :only => [:index, :show]
  #  before_action :check_for_user, :only => [:edit, :update]
  def index
    @giraffes = Giraffe.all
  end

  def new
    @giraffe = Giraffe.new
  end

  def create
  @giraffe = Giraffe.new(giraffe_params)
  if @giraffe.save
    session[:giraffe_id] = @giraffe.id
    redirect_to edit_giraffe_path(@giraffe)
  else
    render :new
  end
  end


  def edit
    @giraffe = Giraffe.find params[:id]
  end

  def update
    @giraffe = Giraffe.find params[:id]
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @giraffe.image = req["url"]
    end
    if @giraffe.update(giraffe_params)
      redirect_to giraffe_path
    else
      render :edit
    end
  end

  def show
    @giraffe = Giraffe.find params[:id]
  end

  def destroy
    giraffe = Giraffe.find params[:id]
    giraffe.destroy
    redirect_to giraffes_path
  end

  private
  def giraffe_params
    params.require(:giraffe).permit( :first_name, :last_name, :image, :city, :dob, :occupation, :fav_food, :hobby, :bm_contribution, :fav_bm_memory, :anything_else, :email, :password, :password_confirmation)
  end
end
