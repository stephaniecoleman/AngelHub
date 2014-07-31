require 'rails_helper'

RSpec.describe Project, :type => :model do

  describe 'validations' do

    context 'without a title' do
      subject { build(:project, :title => nil) }
      it { should_not be_valid }
    end

    context 'without a description' do
      subject{ build(:project, :description => nil) }
      it { should_not be_valid }
    end

    context 'without a status' do
      subject{ build(:project, :status => nil) }
      it { should_not be_valid }
    end

    context 'invalid status' do

      it 'can only be requested, in_progress, or finished' do

        expect { build(:project, :status => 'something random') }.to raise_error(ArgumentError)
        expect(build(:project, :status => 'requested')).to be_valid
        expect(build(:project, :status => 'in_progress')).to be_valid
        expect(build(:project, :status => 'finished')).to be_valid
      end
    end

  end
end
