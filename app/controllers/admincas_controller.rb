class AdmincasController < ApplicationController
  before_action :set_adminca, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /admincas or /admincas.json
  def index
    @moderation = Post.where(post_type: "M")
  end

  # GET /admincas/1 or /admincas/1.json
  def show
  end

  # GET /admincas/new
  def new
    @adminca = Adminca.new
  end

  # GET /admincas/1/edit
  def edit
  end

  # POST /admincas or /admincas.json
  def create
    @adminca = Adminca.new(adminca_params)

    respond_to do |format|
      if @adminca.save
        format.html { redirect_to adminca_url(@adminca), notice: "Adminca was successfully created." }
        format.json { render :show, status: :created, location: @adminca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adminca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admincas/1 or /admincas/1.json
  def update
    respond_to do |format|
      if @adminca.update(adminca_params)
        format.html { redirect_to adminca_url(@adminca), notice: "Adminca was successfully updated." }
        format.json { render :show, status: :ok, location: @adminca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adminca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admincas/1 or /admincas/1.json
  def destroy
    @adminca.destroy

    respond_to do |format|
      format.html { redirect_to admincas_url, notice: "Adminca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminca
      @adminca = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adminca_params
      params.fetch(:post, {})
    end
end
