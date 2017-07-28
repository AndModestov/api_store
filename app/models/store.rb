class Store < ApplicationRecord
  belongs_to :company
  has_many :exemplars

  validates :name, presence: true
end
