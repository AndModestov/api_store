require 'rails_helper'

RSpec.describe Exemplar, type: :model do
  it { should belong_to :product }
  it { should belong_to :store }
end
