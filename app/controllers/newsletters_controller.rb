class NewslettersController < ApplicationController
  require 'rubygems'
  require 'yaml'
  require 'google_calendar'
  before_filter :authenticate_user!, :except => [:index, :archive]
  before_filter :admin_user, :except => [:index, :archive]
  before_filter :advertising
  layout :layout_by_resource


  def index
    @newsletter= Newsletter.order('newsletters.period ASC').where(:visible => true).last
    @club=Club.last
    oauth_yaml = YAML.load_file('.google-api.yaml')

    @cal = Google::Calendar.new(:client_id     => oauth_yaml["client_id"],
                               :client_secret => oauth_yaml["client_secret"],
                               :calendar      => oauth_yaml["calendar"],
                               :redirect_url  => "urn:ietf:wg:oauth:2.0:oob",
                               :refresh_token=> oauth_yaml["refresh_token"]) # this is what Google uses for 'applications'
    end
    def archive
      oauth_yaml = YAML.load_file('.google-api.yaml')
      @cal = Google::Calendar.new(:client_id     => oauth_yaml["client_id"],
                                  :client_secret => oauth_yaml["client_secret"],
                                  :calendar      => oauth_yaml["calendar"],
                                  :redirect_url  => "urn:ietf:wg:oauth:2.0:oob",
                                  :refresh_token=> oauth_yaml["refresh_token"]) # this is what Google uses for 'applications'

      @club=Club.last
      @newsletter = Newsletter.find(params[:id])
    end

  def list
    @newsletters = Newsletter.order('newsletters.period DESC')
  end

  def show
    @newsletter = Newsletter.find(params[:id])
    oauth_yaml = YAML.load_file('.google-api.yaml')
    @cal = Google::Calendar.new(:client_id     => oauth_yaml["client_id"],
                                :client_secret => oauth_yaml["client_secret"],
                                :calendar      => oauth_yaml["calendar"],
                                :redirect_url  => "urn:ietf:wg:oauth:2.0:oob",
                                :refresh_token=> oauth_yaml["refresh_token"]) # this is what Google uses for 'applications'


  end

  def new
    @newsletter=Newsletter.new
  end

  def create
    #Instantiate a new object using form parameters
    @newsletter=Newsletter.new(params[:newsletter])
    #Save the object
    if @newsletter.save
      #If save succeeds, redirect to the list action
      flash[:notice] = "Newsletter created."
      redirect_to(:action => 'fill', :id => @newsletter.id)
    else
      #if save fails, redisplay the form so us
      render('new')
    end

  end


  def edit
    @newsletter=Newsletter.find(params[:id])

  end

  def fill
    @newsletter=Newsletter.find(params[:id])
    @club=Club.last
    @president = User.where(:status => "Active", :leadership => %w(President)).first
    @treasurer = User.where(:status => "Active", :leadership => %w(Treasurer)).first
    @editor=User.where(:status => "Active", :newsletter_editor => %w(Editor)).first
    @secretary=User.where(:status => "Active", :leadership => %w(Secretary)).first
    @photographer=User.where(:status => "Active", :photographer => %w(Photographer)).first
    @leaders = User.sorted_by_leadership.where(:status => "Active", :leadership => ['President', 'Vice President', 'Secretary', 'Treasurer', 'Lion Tamer', 'Tail Twister', 'Membership Chair', 'Director 2 Year', 'Past President'])
    @users=User.where(:status => "Active")
    @officers = User.sorted_by_officers.where(:status => "Active", :officers => ['LOMFI President'])
  end

  def update
    #Find object using form parameters
    @newsletter=Newsletter.find(params[:id])
    #Update the object
    if @newsletter.update_attributes(params[:newsletter])
      #If update succeeds, redirect to the list action
      flash[:notice] = "Newsletter updated."
      redirect_to(:action => 'show', :id => @newsletter.id
      )
    else
      #if update fails, redisplay the form so us
      render('edit')
    end


  end

  def delete
    @newsletter=Newsletter.find(params[:id])
  end

  def destroy #Process delete record form
    newsletter = Newsletter.find(params[:id])
    newsletter.destroy
    flash[:notice] = "Newsletter destroyed."
    redirect_to(:action => 'list')
  end


  protected
  def layout_by_resource
    if controller_name == 'newsletters' && action_name == 'index'
      'application'
    elsif controller_name == 'newsletters' && action_name == 'archive'
      'application'
    else
      'admin'
    end
  end
end