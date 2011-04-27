class PeopleController < ApplicationController

  before_filter :authenticate, :only => :show

  def index
    @people = [
        'luke-skywalker', 
        'darth-vader'
      ]
  end
  
  def show
    @person = params[:id]
  end
  
  private
  
  def authenticate
    if params[:id] == "darth-vader"
      redirect_to people_url, :notice => "You no can have, force is weak in you."
      
    end
  end
  
end
