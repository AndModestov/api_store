class ExemplarSerializer < ActiveModel::Serializer
  attributes :id, :store_id, :product_id, :product_type, :status
end
