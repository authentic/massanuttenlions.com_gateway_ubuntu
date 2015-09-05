class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user
  layout "admin"

  def index
    list
    render "list"
  end

  def list
    @users = User.order("users.user_name ASC")
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user = User.new


  end

  def create
    #Instantiate a new object using form parameters
    @user = User.new(params[:user])
    #@user.skip_confirmation!
    if @user.save
      #If save succeeds, redirect to the list action
      flash[:notice] = 'User created.'
      redirect_to(:action => 'list')
    else
      #if save fails, redisplay the form so us
      render('new')
    end
  end

  def edit
    @user=User.find(params[:id])
    @user_count=User.count
  end

  def update
    #Find object using form parameters
    @user=User.find(params[:id])
    #Update the object
    if @user.update_attributes(params[:user])
      #If update succeeds, redirect to the list action
      flash[:notice] = "User updated."
      redirect_to(:action => 'show', :id => @user.id
      )
    else
      #if update fails, redisplay the form so us
      @user_count = User.count
      render('edit')
    end
  end


  def delete #Display delete record form
    @user=User.find(params[:id])
  end

  def destroy #Process delete record form
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'list')
  end
end
