require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'connections' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to have_many(:tags) }
    it { expect(subject).to have_many(:taggings) }
  end

  describe 'validations' do
    describe 'it validates name' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:content) }
      it { is_expected.to validate_presence_of(:post_type) }

      it { expect(subject).to validate_length_of(:title).is_at_least(10).is_at_most(100) }
    end
  end

end