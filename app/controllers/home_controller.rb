class HomeController < ApplicationController
  layout 'application'
  
  def index
    @countries = if params[:q].present?
                   Country.text_search(params[:q])
                 else
                   Country.all
                 end
  end
end
