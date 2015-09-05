class MembersController < ApplicationController
  layout 'application'
  before_filter :advertising

  def index
    show
    render('show')

  end

  def show
    @users = User.sorted.where(:status => "Active")

  end
end
