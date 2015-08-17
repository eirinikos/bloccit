class AdvertisementsController < ApplicationController
  def index
    @adverts = Advertisement.all
  end

  def show
    @advert = Advertisement.find(params[:id])
  end
end
