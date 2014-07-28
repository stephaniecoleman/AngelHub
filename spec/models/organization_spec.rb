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

    context 'ununique name' do
      before do
        @common_name = Faker::Company.name
        create(:organization, :name => @common_name)
      end

      subject { build(:organization, :name => @common_name) }

      it { should be_invalid }
    end

  end

  describe 'relationships' do

    it 'has no projects by default' do
      organization = create(:organization)

      expect(organization.projects.count).to be(0)
    end
    
    it "has many projects" do
      expect{ create(:organization_with_projects) }.not_to raise_error

      organization = create(:organization_with_projects, count: 5)
      expect(organization.projects.count).to be(5)
    end

    it "has developers through projects" do

    end
    
  end
end