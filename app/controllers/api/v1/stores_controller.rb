class Api::V1::StoresController < ApplicationController

  def index
    stores = set_stores
    
    unless stores.nil?
      render json: stores, each_serializer: StoreSerializer
    else
      render json: { errors: ['filter error'] }, status: 400
    end
  end


  private

  def set_stores
    if params[:filter_type].present? && params[:filter_params].present?
      Store.filter_by(params[:filter_type], params[:filter_params])
    else
      Store.all
    end
  end
end
