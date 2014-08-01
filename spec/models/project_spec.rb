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

  describe 'scopes' do
    describe 'search' do
      it "does a derived search on the ActiveRecord::Relation obj" do
        desc = "first project desc"
        first_project = create(:project, :title => "aspc", :description => desc)
        second_project = create(:project, :title => "asp")

        search = Project.where(:description => desc).search('asp')
        expect(search).to include(first_project)
        expect(search).to_not include(second_project)
      end

      describe "by default" do
        it "does a search based on title" do
          project = create(:project, :title => "ruby on rails")

          expect(Project.search('ruby')).to include(project)
        end

        it "does a search based on tags" do
          project = create(:project)
          project.tags << create(:tag, :name => "quack")

          expect(Project.search('quack')).to include(project)
        end

        it "treats commas as different tags" do
          first_project = create(:project)
          second_project = create(:project)

          rb_tag = create(:tag, :name => "ruby")

          first_project.tags << rb_tag
          first_project.tags << create(:tag, :name => "rails")
          second_project.tags << rb_tag

          search_results = Project.search('ruby, rails')

          expect(search_results).to include(first_project)
          expect(search_results).to_not include(second_project)
        end

        it "does a search based on categories" do
          project = create(:project)
          project.categories << create(:category, name: "Programming")

          expect(Project.search("Programming")).to include(project)
        end

        it "does a case insensitive search" do
          first_project = create(:project, :title => "proGrammInG")
          second_project = create(:project)
          third_project = create(:project)
          second_project.tags << create(:tag, :name => "PROGRAMMING")
          third_project.categories << create(:category, :name => "programming")

          expect(Project.search('programming')).to include(first_project, second_project, third_project)
        end

        it "does not return duplicates when found projects meet multiple criterias" do
          project = create(:project, title: "programming")
          project.tags << create(:tag, name: "progressive")
          project.categories << create(:category, name: "prorams")

          search_results = Project.search('prog', :set)

          expect(search_results.where(:id => project.id).count).to eq(1)
        end


      end

    end

  end

  describe 'mixins' do
    it "finds a union of projects by tag" do
      first_project = create(:project)
      second_project = create(:project)

      first_project.tags << create(:tag, :name => "Ruby")
      second_project.tags << create(:tag, :name => "Random")

      expect(Project.tagged_as_any('Ruby', 'Random')).to include(first_project, second_project)
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
