class Store < ApplicationRecord
  belongs_to :company
  has_many :exemplars

  validates :name, presence: true

  scope :with_books_in_stock, -> (book_ids) do
    joins(:exemplars).where(exemplars: { product_id: book_ids, product_type: 'Book' })
  end
end
