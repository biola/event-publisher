class AdminConstraint
  def matches?(request)
    return false unless request.session.present? && request.session['cas']['user']
    user = User.where(username: request.session['cas']['user']).first
    user && user.admin?
  end
end
