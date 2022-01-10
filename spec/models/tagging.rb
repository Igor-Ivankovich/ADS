require 'rails_helper'

RSpec.describe Tagging, type: :model do

  context 'connections' do
    it { expect(subject).to belong_to(:tag) }
    it { expect(subject).to belong_to(:post) }
  end

end
