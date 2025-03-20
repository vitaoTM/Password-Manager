class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, except: [:index, :new, :create]

  def index
    @groups = current_user.groups.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
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

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
