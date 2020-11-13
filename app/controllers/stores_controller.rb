class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    if @store.save

    else
      render 'new'
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :genre, :phone, :access,
                                  :hour, :website, :address)
  end
end
