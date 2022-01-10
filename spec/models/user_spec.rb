require 'rails_helper'

RSpec.describe User, type: :model do

  context 'connections' do
    it { expect(subject).to belong_to(:role).optional }
  end

  describe 'validations' do
    describe 'it validates name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end
  end

  context 'guest & user roles' do

    it 'verification role' do
      p subject
      expect(subject.role_id?).not_to be
    end

    it 'verification role after create' do
      subject.role_id = 2
      expect(subject.role_id?).to be
    end
  end

end