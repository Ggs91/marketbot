module SessionsHelper
  def current_user
    find_or_create_user
  end

  private

  def find_or_create_user
    if User.exists?(id: session[:user_id])
      User.find_by(id: session[:user_id])
    else
      user = User.create
      session[:user_id] = user.id
      user
    end
  end
end
