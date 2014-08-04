class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate!
  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  layout -> { (@layout || :application).to_s }

  helper_method :current_user
  def current_user
    authentication.user
  end

  protected

  def authenticate!
    authentication.perform or render_error_page(401)
  end

  def authentication
    @authentication ||= CasAuthentication.new(session)
  end

  def render_error_page(status)
    render file: "#{Rails.root}/public/#{status}", formats: [:html], status: status, layout: false
  end

  def user_not_authorized
    render_error_page(403)
  end

  def set_parent
    if params[:event_id].present?
      @parent = Event.find(params[:event_id])
    else
      flash[:error] = "Nothing to assign actor to"
      redirect_to :back
    end
  end

  def parent_edit_path(parent, options = {})
    send("edit_#{parent.class.to_s.underscore}_path", parent.id, options) if parent
  end
end
