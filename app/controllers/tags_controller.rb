class TagsController < ApplicationController
  load_and_authorize_resource
  def index
    @tags = Tag.all
    @taging = Tagging.all
  end

  # GET /roles/1 or /roles/1.json
  def show
  end

  # GET /roles/new
  def new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles or /roles.json
  def create
    # @tag = User.new(user_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tag_url(@tag), notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_url(@tag), notice: "Role was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end