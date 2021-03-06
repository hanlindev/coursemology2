class Admin::Controller < ApplicationController
  layout 'admin'
  before_filter :authorize_admin

  private

  def authorize_admin
    authorize!(:manage, current_tenant)
  end

  add_breadcrumb :index, :admin_path
end
