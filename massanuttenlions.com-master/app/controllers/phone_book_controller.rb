class PhoneBookController < ApplicationController
  before_filter :advertising

  def index
    render 'show'
  end

  def show
    @users = User.order(sort_column + ' ' + sort_direction).where(:status => "Active")

  end


  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end