class Exemplar < ApplicationRecord
  belongs_to :product, polymorphic: true
  belongs_to :store
end
