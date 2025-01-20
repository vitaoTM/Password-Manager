class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password, except: [:index, :new, :create]

  def index
    @passwords = current_user.passwords
  end

  def show
  end

  def new
    @password = Password.new
  end

  def create
    @password = Password.new(password_params)
    @password.user_passwords.new(user: current_user)
    if @password.save

    # @password = current_user.passwords.create(password_params)
    # if @password.persisted?
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end

    def edit
    end

    def update
      if @password.update(password_params)
        redirect_to @password
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @password.destroy
      redirect_to root_path
    end
  end

  private

  def password_params
    params.require(:password).permit(:url, :username, :password)
  end

  def set_password
    @password = current_user.passwords.find(params[:id])
  end
end
