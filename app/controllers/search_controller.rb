class SearchController < ApplicationController 
  def index
    search_params = params[:nation]
    
    conn = Faraday.new(url: "https://last-airbender-api.fly.dev/")
    
    response = conn.get("/api/v1/characters?affiliation=#{search_params}&perPage=100")
    
    @members = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end
end