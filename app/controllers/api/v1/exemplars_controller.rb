class Api::V1::ExemplarsController < ApplicationController
  before_action :set_exemplars, only: :sell

  def sell
    if @exemplars.present?
      @exemplars.update_all status: 'sold'
      render json: @exemplars, each_serializer: ExemplarSerializer
    else
      render json: { errors: ['no exemplar ids provided'] }, status: 400
    end
  end


  private

  def set_exemplars
    @exemplars = Exemplar.where(id: params[:ids])
  end
end
