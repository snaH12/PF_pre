class Public::RegionsController < ApplicationController
  def index
    regions = Region.all
  end

  def show
  end
end
