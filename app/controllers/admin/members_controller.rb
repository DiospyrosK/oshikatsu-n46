class Admin::MembersController < ApplicationController
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
end
