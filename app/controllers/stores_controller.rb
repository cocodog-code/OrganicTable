class StoresController < ApplicationController
  def new
  end

  def show
    @store = Store.find(params[:id])
  end
end
