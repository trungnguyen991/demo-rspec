require 'rails_helper'

RSpec.describe 'employees/index.html.slim', type: :view do
  let(:user) {
    FactoryGirl.create(:user)
  }
  let!(:employee) {
    FactoryGirl.create(:employee)
  }

  before do
    page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user))
  end

  describe 'employees page', :type => :feature do
    it 'all' do
      visit employees_path
      expect(page).to have_content employee.code
      expect(page).to have_content employee.name
    end
  end
end
