require 'rails_helper'

RSpec.describe Role, type: :model do

  context 'connections' do

    it { expect(subject).to have_many(:users) }
  end

  describe 'validations' do
    describe 'it validates name' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end


end