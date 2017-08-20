class SearchSuggestionsController < ApplicationController
  def index
    render json: Country.for_autocomplete(params[:term]).limit(10).pluck(:name)
  end
end
