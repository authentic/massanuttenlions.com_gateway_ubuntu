class AccessController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :admin_user

  def index
    menu
    render('menu')
  end

  def menu
  end

  def login
  end


end
