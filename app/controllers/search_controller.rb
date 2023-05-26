class SearchController < ApplicationController 
  def index
    search_params = params[:nation]
    
    @members = AvatarService.new.get_members(search_params)

    @twenty_five_members = @members[0..24]
  end
end