class ResourcesController < ApplicationController
  #skip_before_action :authorize, only: [:create, :new]
  before_action :authorize
  before_action :set_resource, only: [:show, :edit, :update, :destroy, :like, :dislike]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /resources/new
  def new
    @resource = Resource.new
	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /resources/1/edit
  def edit
	@categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /resources
  # POST /resources.json
  def create
	@categories = Category.all.map{|c| [ c.name, c.id ] }
    @resource = Resource.new(resource_params)
	@resource.score = 0
	@resource.last_modified = Date.today
	@resource.user_id = current_user.id
	@resource.category_id = params[:category_id]
	
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, notice: 'Was not able to create the Resource.' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
	@resource.user_id = current_user.id
	@resource.category_id = params[:category_id]
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   # POST /resources/1/like
  def like
    @resource.score = @resource.score + 1

      respond_to do |format|
        if @resource.save
          format.html { redirect_to resources_url, notice: 'Resource was liked successfully.' }
          format.js   {} 
          format.json { render :show, status: :ok, location: @resource }
        else
          format.html { render :edit }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
  end
  
  # POST /resources/1/dislike
  def dislike
    @resource.score = @resource.score - 1
    
      respond_to do |format|
        if @resource.save
          format.html { redirect_to resources_url, notice: 'Resource was disliked successfully.' }
          format.js   {}
          format.json { render :show, status: :ok, location: @resource }
        else
          format.html { render :edit }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :description, :link, :last_modified, :user_id, :score, :category_id)
    end
end
