class ClubController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_filter :admin_user

  def index
    list
    render('list')

  end

  def list
    @clubs = Club.order("clubs.created_at DESC")
  end

  def new
    @club=Club.new
    @club_count = Club.count + 1
  end

  def create

    #Instantiate a new event using form parameters
    @club=Club.new(params[:club])
    #Save the object
    if @club.save

      #If save succeeds, redirect to the list action
      flash[:notice] = "Club created."
      redirect_to(:action => 'list')
    else
      #if save fails, redisplay the form so us
      @club_count = Club.count+1
      render('new')
    end

  end

  def edit
    @club=Club.find(params[:id])
    @club_count = Club.count
  end

  def update
    #Find object using form parameters
    @club=Club.find(params[:id])
    #Update the object
    if @club.update_attributes(params[:club])
      #If update succeeds, redirect to the list action
      flash[:notice] = "Club Information updated."
      redirect_to(:action => 'list', :id => @club.id
      )
    else
      #if update fails, redisplay the form so us
      @club_count_count = Club.count
      render('edit')
    end
  end

  def delete #Display delete record form
    @club=Club.find(params[:id])
  end

  def destroy #Process delete record form
    club = Club.find(params[:id])
    club.destroy
    flash[:notice] = "Club Information destroyed."
    redirect_to(:action => 'list')
  end
end
