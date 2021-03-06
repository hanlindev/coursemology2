require 'rails_helper'

RSpec.describe Admin::Controller, type: :controller do
  controller do
    def index
      render text: 'Success'
    end
  end

  requires_login

  it 'allows instance administrators to access the page' do
    sign_in(create(:administrator))
    get :index
    expect(response.status).to eq(200)
  end

  it 'does not allow users to access the page' do
    sign_in(create(:user))
    expect { get :index }.to raise_exception(CanCan::AccessDenied)
  end
end
