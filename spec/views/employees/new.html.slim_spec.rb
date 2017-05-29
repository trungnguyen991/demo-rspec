require 'rails_helper'

RSpec.describe 'employees/new.html.slim', type: :view do
  let(:user) {
    FactoryGirl.create(:user)
  }

  before do
    page.set_rack_session("warden.user.user.key" => User.serialize_into_session(user))
  end

  describe 'new employee page', :type => :feature do
    it '#new form valid' do
      visit new_employee_path
      within('form') do
        fill_in 'employee[code]', with: 'NV1234'
        fill_in 'employee[name]', with: 'Malia'
        fill_in 'employee[email]', with: 'malia@email.com'
        select 'Female', :from => 'employee[gender]'
        fill_in 'employee[dob]', with: '1990-02-03'
        fill_in 'employee[phone_number]', with: '1234567899'
        fill_in 'employee[address]', with: '42 abc'
      end
      # save_and_open_screenshot
      click_button 'Submit'
      expect(page).to have_content 'NV1234'
      expect(page).to have_content 'Malia'
    end

    it '#new form invalid with code' do
      visit new_employee_path
      within('form') do
        fill_in 'employee[code]', with: ''
        fill_in 'employee[name]', with: 'Malia'
        fill_in 'employee[email]', with: 'malia@email.com'
        select 'Female', :from => 'employee[gender]'
        fill_in 'employee[dob]', with: '1990-02-03'
        fill_in 'employee[phone_number]', with: '1234567899'
        fill_in 'employee[address]', with: '42 abc'
      end
      click_button 'Submit'
      expect(page).to render_template(:new)
    end
  end
end
