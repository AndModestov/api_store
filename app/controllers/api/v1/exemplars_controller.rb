class Api::V1::ExemplarsController < ApplicationController

  def update
    exemplars = Exemplar.where(id: params[:ids]).order(:id)

    if exemplars.present?
      exemplars.update_all(exemplar_params.to_h)
      render json: exemplars.reload, each_serializer: ExemplarSerializer
    else
      render json: { errors: ['no exemplar ids provided'] }, status: 400
    end
  end

  private

  def exemplar_params
    params.require(:exemplar).permit(:store_id, :status)
  end
end
