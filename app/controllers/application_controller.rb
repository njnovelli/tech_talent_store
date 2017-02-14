class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameter, if: :devise_controller?
  
  before_filter :categories, :brands, :line_items


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
    end
  end

  def categories
  	@categories = Category.all
  end

  def brands
  	@brands = Product.pluck(:brand).sort.uniq!
  		# if @brands == nil
  		# 	@brands = Product.pluck(:brand).sort
  		# end
  end

  def line_items
    @line_items = LineItem.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

end
