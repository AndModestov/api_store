class Api::V1::StoresController < ApplicationController
  before_action :set_stores, only: :index

  def index
    unless @stores.nil?
      render json: @stores, each_serializer: StoreSerializer
    else
      render json: { errors: ['invalid publisher_id'] }, status: 404
    end
  end


  private

  def set_stores
    @stores =
      if params[:publisher_id].present?
        publisher = Publisher.find_by(id: params[:publisher_id])
        publisher.present? ? Store.with_books_in_stock(publisher.books.ids) : nil
      else
        Store.all
      end
  end
end
