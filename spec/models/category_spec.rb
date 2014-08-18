require 'rails_helper'

RSpec.describe Category, :type => :model do

  describe 'validations' do
    context 'without a name' do
      subject { build(:category, :name => nil) }
      it { should be_invalid }
    end

    context 'duplicate name' do
      before do
        @duplicate_name = Faker::Commerce.department
      end

      it "should not be valid" do
        create(:category, :name => @duplicate_name)

        expect(build(:category, :name => @duplicate_name)).to be_invalid
      end
    end
  end
end
