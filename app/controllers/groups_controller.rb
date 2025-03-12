class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
    @user = current_user

  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if current_user.group
      # will allow more than 1 group per user???
    end

    if @group.save
      current_user.group = @group
      current_user.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to @groups
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # to do
  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
