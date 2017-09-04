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
    send("filter_by_#{type}", params)
  rescue NoMethodError => e
    puts "Error: #{e.message}. Backtrace: #{e.backtrace}"
    nil
  end


  private

  def self.filter_by_publisher params
    publisher = Publisher.find_by(id: params[:publisher_id])
    publisher.present? ? Store.with_books_in_stock(publisher.books.ids) : nil
  end
end
