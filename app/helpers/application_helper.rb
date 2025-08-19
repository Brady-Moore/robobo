module ApplicationHelper
  def bootstrap_class_for_flash(key)
    case key.to_s
    when "notice" then "alert-success"
    when "alert"  then "alert-danger"
    else "alert-info"
    end
  end
end
