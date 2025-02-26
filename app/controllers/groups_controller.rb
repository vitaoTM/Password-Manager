class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    if @group.nil?
      render :new
    else
      @group = current_user.group.name
    end

    # @groups =  current_user.group.name
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def group_params
    params.permit(:name)
  end
end
