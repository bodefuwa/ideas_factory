class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :user_is_current_user

  # GET /ideas
  # GET /ideas.json
  def index
    if params[:stage].blank?
      @ideas = current_user.ideas
    else 
      @stage_id = Stage.find_by(name: params[:stage]).id
      @ideas = current_user.ideas.where(stage_id: @stage_id).order("created_at DESC")
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    #@idea = current_user.ideas.where(idea_params)
  end

  # GET /ideas/new
  def new
    @idea = current_user.ideas.build
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.build(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to current_user.ideas, notice: 'An idea is born' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to ideas_path, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'That idea has been canned.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :summary, :idea_type, :color, :image, :link, :github, :stage_id, :category_id)
    end

    def user_is_current_user
     # unless current_user.id == params[:user_id]
     # flash[:notice] = "You may only view your own ideas."
     #   redirect_to root_path
     # end
    end
end
