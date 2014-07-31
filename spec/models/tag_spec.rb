require 'rails_helper'

RSpec.describe Tag, :type => :model do

  describe 'validations' do

    context "without a name" do
      subject { build(:tag, :name => nil) }
      it { should be_invalid }
    end

    context "with duplicate name" do
      before do
        @duplicate_name = "ruby on rails"
        create(:tag, :name => @duplicate_name)
      end

      subject { build(:tag, :name => @duplicate_name) }
      it { should be_invalid }
    end
  end

  describe "relationships" do

    describe "has many" do

      describe "tagged_object" do

        it "should have many" do
          tag = create(:tag)

          object = create(:tagged_object, :tag => tag)

          expect(tag.tagged_objects).to include(object)
        end

        it "keeps count in tagged_count attribute" do

          tag = create(:tag)

          expect{ create(:tagged_object, :tag => tag) }.to change{ tag.reload.tagged_count }.by(1)
        end

      end


    end

  end
end
