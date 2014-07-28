require 'rails_helper'

RSpec.describe Organization, :type => :model do

  describe 'validations' do

    context 'without a name' do
      subject { build(:organization, :name => nil) }
      it { should be_invalid }
    end

    context 'without a url' do
      subject { build(:organization, :url => nil) }
      it { should be_invalid }

    end

    context 'without a description' do
      subject { build(:organization, :description => nil) }
      it { should be_invalid }
    end

  end

  describe 'relationships' do
    
  end
end