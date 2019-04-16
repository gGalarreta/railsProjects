require 'rails_helper'


RSpec.describe TokenStudent, type: :model do
  it { should validate_presence_of(:token) }
  it { should_not allow_value("123456").for(:token) }
end
