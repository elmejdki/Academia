module UsersHelper
  def error_action(field)
    render partial: 'error_handler', locals: { source: field } if resource.errors[field].any?
  end
end
