# frozen_string_literal: true

class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
  add_flash_types :info, :error, :warning, :notice
=======
  def after_sign_in_path_for(_resource)
    admin_admin_products_path
  end
>>>>>>> Stashed changes
end
