class Exemplar < ApplicationRecord
  belongs_to :product, polymorphic: true
  belongs_to :store

  enum status: { 'in stock' => 0, 'sold' => 1 }
end
