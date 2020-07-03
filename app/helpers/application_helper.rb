module ApplicationHelper
  def current_class?(test_path)
    return 'active text-white' if request.path == test_path
    ''
  end
end
