class Book < ApplicationRecord
  belongs_to :publisher
  has_many :exemplars, as: :product, dependent: :destroy

  validates :name, presence: true
end
