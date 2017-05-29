require 'rails_helper'

RSpec.describe Employee, type: :model do

  let(:employee) { FactoryGirl.create(:employee) }
  let(:employee_2) { FactoryGirl.create(:employee) }

  describe 'validations' do
    context 'with valid attributes' do
      it 'should have valid employee factory' do
        expect(employee).to be_valid
      end
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(50) }
      it { should validate_length_of(:code).is_equal_to(6) }
      it { should validate_presence_of(:code) }
      it { should validate_length_of(:phone_number).is_at_most(15) }
      it { should validate_presence_of(:phone_number) }
    end

    context 'with invalid attributes' do
      it 'is not valid without an email' do
        employee.email = nil
        expect(employee).to_not be_valid
      end
      it 'is not valid with a name is empty' do
        employee.name = ''
        expect(employee).to_not be_valid
      end
      it 'is not valid with an email exist' do
        employee.email = employee_2.email
        expect(employee).to_not be_valid
      end
      it 'is not valid with phone_number is empty' do
        employee.phone_number = nil
        expect(employee).to_not be_valid
      end
      it 'is not valid without code' do
        employee.code = nil
        expect(employee).to_not be_valid
      end
    end
  end
end
