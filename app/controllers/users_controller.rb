# frozen_string_literal: true

# User controller class
class UsersController < ApplicationController
  load_and_authorize_resource
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)

    @last_login = if @user.current_sign_in_at
                    @user.current_sign_in_at.to_formatted_s(:short)
                  else
                    'never'
                  end
  end

  # POST /users or /users.json
  def create
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = check_successfully_updated

    if successfully_updated
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def check_successfully_updated
    if needs_password?(@user, user_params)
      @user.update(user_params)
    else
      @user.update_without_password(user_params)
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :role_id
    )
  end

  def needs_password?(_user, params)
    params[:password].present?
  end
end
