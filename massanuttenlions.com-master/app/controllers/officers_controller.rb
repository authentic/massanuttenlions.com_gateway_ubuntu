class OfficersController < ApplicationController
  layout 'application'
  before_filter :advertising

  def index
    show
    render('show')

  end

  def show

    @users_officers = User.sorted_by_officers.where(:status => "Active", :officers => ['LOMFI President', 'LOMFI Vice President', 'LOMFI Secretary', 'LOMFI Treasurer'])
    @users_leadership = User.sorted_by_leadership.where(:status => "Active", :leadership => ['President', 'Vice President', 'Secretary','Treasurer', 'Past President'])
    @current_year=Club.last
  end
end
