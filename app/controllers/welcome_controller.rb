class WelcomeController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :require_admin, only: [:admin]

def admin
  @users = User.order("created_at desc").page(params[:page]).per_page(5)
end

end