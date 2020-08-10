class Api::V1::VenuesController < ApiController
  before_action :set_venue
  def show

  end

  private

    def set_venue
      @venue = Venue.find(params[:id])
    end
end
