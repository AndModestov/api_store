require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should belong_to :company }
  it { should have_many(:exemplars)}
  it { should validate_presence_of :name }
end
