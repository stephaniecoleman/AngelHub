require 'rails_helper'

RSpec.describe Developer, :type => :model do

  describe 'validations' do

    context 'without a name' do
      subject { build(:developer, :name => nil) }
      it { should be_invalid }
    end

    context 'without a url' do
      subject { build(:developer, :github_url => nil) }
      it { should be_invalid }
    end

  end
  
end
