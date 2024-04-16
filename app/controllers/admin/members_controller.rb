class Admin::MembersController < ApplicationController
  before_action :check_admin?

  def create
    @member = Member.new(member_params)
    @members = Member.all
    @member.save
  end

  def index
    @members = Member.all
    @member = Member.new
  end

  def destroy
    @members = Member.all
    @member = Member.find(params[:id])
    @member.destroy
  end

  private
  def member_params
    params.require(:member).permit(:name)
  end

  def check_admin?
    unless current_user.admin
      redirect_to root_path
    end
  end
end
