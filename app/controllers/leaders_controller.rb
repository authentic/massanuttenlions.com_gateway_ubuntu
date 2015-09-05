class LeadersController < ApplicationController
  layout 'application'
  before_filter :advertising

  def index
    show
    render('show')

  end

  def show
    @users = User.sorted_by_leadership.where(:status => "Active", :leadership => ['President', 'Vice President', 'Secretary', 'Treasurer', 'Lion Tamer', 'Tail Twister', 'Membership Chair', 'Director 2 Year', 'Past President'])
    @users_officers = User.sorted_by_officers.where(:status => "Active", :officers => ['LOMFI President'])
    @current_year=Club.last
  end
end
