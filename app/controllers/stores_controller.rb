class StoresController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  def index
    @stores = if current_user.admin?
                current_user.stores.all
              else
                Store.all
             end
  end

  # GET /stores/1
  def show; end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit; end

  # POST /stores
  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id

    if @store.save
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      redirect_to @store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
    redirect_to stores_url, notice: 'Store was successfully destroyed.'
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name)
  end
end
