class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def index
    @stores = Store.all.page(params[:page]).per(5)
  end

  def show
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:success] = "A new restaurant has been registered"
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:success] = "レストランの情報を更新しました。"
      redirect_to @store
    else
      render 'edit'
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :genre, :phone, :access,
                                  :hour, :website, :address, :description, :image)
  end
end
