require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:employee) { FactoryGirl.create(:employee) }
  before do
    sign_in FactoryGirl.create(:user)
  end

  describe 'GET #index' do
    it 'render index' do
      get :index
      assert_equal Employee.all, assigns(:employees)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders new user page' do
      get :new
      expect(assigns[:employee]).to be_a_new(Employee)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'valid employee' do
      post :create, params: {employee: FactoryGirl.attributes_for(:employee)}
      expect(response).to redirect_to(employees_path)
    end

    it 'invalid employee' do
      invalid_employee_params = FactoryGirl.attributes_for(:employee)
      invalid_employee_params[:name] = ''
      post :create, params: {employee: invalid_employee_params}
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'render edit employee page' do
      get :edit, params: {id: employee}
      expect(assigns[:employee].id).to eq(employee.id)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #update' do
    it 'valid user' do
      new_info = {name: 'Ryan',phone_number: '01234567779'}
      post :update, params: {id: employee, employee: new_info}
      expect(assigns[:employee].name).to eq(new_info[:name])
      expect(assigns[:employee].phone_number).to eq(new_info[:phone_number])
      expect(response).to redirect_to(employees_path)
    end

    it 'invalid user' do
      new_info = {code: '123'}
      post :update, params: {id: employee, employee: new_info}
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy' do
      delete :destroy, params: {id: employee}
      # assert_equal Employee.count, equal(0)
      expect(response).to redirect_to(employees_path)
    end
  end
end
