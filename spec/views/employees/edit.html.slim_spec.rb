require 'rails_helper'

RSpec.describe 'employees/edit.html.slim', type: :view do
  let(:user) {
    FactoryGirl.create(:user)
  }
  let!(:employee) {
    FactoryGirl.create(:employee)
  }

  before do
    page.set_rack_session("warden.user.user.key" => User.serialize_into_session(user))
  end

  describe 'edit employee page', :type => :feature do
    it '#edit form valid' do
      visit edit_employee_path(employee)
      within('form') do
        fill_in 'employee[name]', with: 'Malia MC'
        fill_in 'employee[dob]', with: '1990-05-03'
        fill_in 'employee[phone_number]', with: '0987654321'
      end
      click_button 'Submit'
      expect(page).to have_content '0987654321'
      expect(page).to have_content 'Malia MC'
    end

    it '#edit form invalid with code' do
      visit edit_employee_path(employee)
      within('form') do
        fill_in 'employee[code]', with: ''
      end
      click_button 'Submit'
      expect(page).to render_template(:edit)
    end
  end
end
