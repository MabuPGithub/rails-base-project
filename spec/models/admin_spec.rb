require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'scope test' do
    let (:params) { {name: 'Test', email: 'testtest@email.com', password: '123456'} } 
    before(:each) do
      User.new(params).save
    end

    it 'should return user' do
      expect(User.first.name).to eq('Test')
    end
  end
end
