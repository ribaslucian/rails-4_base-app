class CardsController < ApplicationController

  def index
    @cards = Card.paginate(:page => params[:page], :per_page => 10).order(:card_id)
  end
  
end
