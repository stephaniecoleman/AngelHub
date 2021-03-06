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
  
  describe 'relationships' do
   
    context 'without a project' do
      it 'should have no projects' do 
        developer = build(:developer)
        expect(developer.projects.count).to be(0)
      end
    end

    context 'with many projects' do
      it 'can have one or many projects' do
        project_count = 5
        projects = create_list(:project, project_count, organization: create(:organization))
        developer = create(:developer_with_projects, associated_projects: projects)
        expect(developer.projects.count).to be(project_count)
      end
    end

  end

end
