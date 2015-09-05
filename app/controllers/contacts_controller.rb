class ContactsController < ApplicationController
  layout 'contact'
  before_filter :advertising

  def contact_us
    @club=Club.last
    @president= User.where(:status => "Active", :leadership => ['President']).first

  end

  def president
    @club=Club.last
    @president= User.where(:status => "Active", :leadership => ['President']).first

  end

  def webmaster
    @club=Club.last
    @webmaster= User.sorted.where(:status => "Active", :webmaster => ['Webmaster'])

  end

  def feedback
  end
end
