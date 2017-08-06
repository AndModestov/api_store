class Store < ApplicationRecord
  belongs_to :company
  has_many :exemplars

  validates :name, presence: true

  scope :with_books_in_stock, -> (book_ids) do
    joins(:exemplars).where(exemplars: { product_id: book_ids, product_type: 'Book', status: 'in stock' })
                     .distinct
                     .order(:id)
  end

  def self.filter_by type, params={}
    case type
    when 'publisher'
      filter_by_publisher params[:publisher_id]
    else
      nil
    end
  end


  private

  def self.filter_by_publisher publisher_id
    publisher = Publisher.find_by(id: publisher_id)
    publisher.present? ? Store.with_books_in_stock(publisher.books.ids) : nil
  end
end
