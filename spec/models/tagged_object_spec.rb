require 'rails_helper'

RSpec.describe TaggedObject, :type => :model do
  
  describe 'validations' do

    context 'assigned the same tag multiple times to same object' do

      it "should be invalid" do
        attributes = {
          tag: build_stubbed(:tag),
          taggable: build_stubbed(:project)
        }
        tagged_obj = create(:tagged_object, attributes)

        invalid_tagged_object = build(:tagged_object, attributes)
        expect(invalid_tagged_object).to be_invalid
      end

    end
  end

  describe 'relationships' do

    describe 'belongs_to' do

      describe 'tag' do
        it { should respond_to(:tag) }

        it 'should return an object of class Tag' do

          expect(build(:tagged_object).tag).to be_an_instance_of(Tag)
        end
      end

      describe 'taggable' do
        it { should respond_to(:taggable) }

      end
    end
  end
end
