class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_if_there_is_new_messages, only: [:index, :show]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fullname, :avatar, :cover_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fullname, :avatar, :cover_picture])
  end

  def check_if_there_is_new_messages(user = current_user)
    @unread_messages = 0

    if user
      rooms = user.rooms.uniq
      rooms.each do |room|
        @unread_messages += room.messages.where('unread = true and user_id != ?', user.id).count
      end
    end

    @unread_messages
  end
end
