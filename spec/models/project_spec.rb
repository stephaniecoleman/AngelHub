require 'rails_helper'

RSpec.describe Project, :type => :model do

  describe 'validations' do

    context 'without a title' do
      subject{ build(:project, :title => nil) }
      it { should_not be_valid }

      it "is a test" do
        binding.pry
      end
    end
  end
end
