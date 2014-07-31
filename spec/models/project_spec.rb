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

  describe 'mixins' do
    it "finds a project by tag" do
      project = create(:project)
      project.tags << create(:tag, name: "Health")

      expect(Project.tagged_as_all('Health')).to include(project)
    end

    it "refines search for a project with mulitple tags" do
      specific = create(:project)
      general = create(:project)
      health_tag = create(:tag, name: "Health")
      sanitation_tag = create(:tag, name: "Sanitation")

      specific.tags << health_tag
      specific.tags << sanitation_tag
      general.tags << health_tag

      expect(Project.tagged_as_all('Health', 'Sanitation')).to include(specific)
      expect(Project.tagged_as_all('Health', 'Sanitation')).to_not include(general)
    end
  end
end
