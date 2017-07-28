require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to :publisher }
  it { should have_many(:exemplars).dependent(:destroy) }
  it { should validate_presence_of :name }
end
