class PublicController < ApplicationController
  layout 'application'

  def index

  end

  def show
    @page=Page.where(:permalink => params[:id], :visible => true).first
    redirect_to(:controller => "static_pages", :action => 'home') unless @page
    @advertising_section=Page.find(76)
  end



end
