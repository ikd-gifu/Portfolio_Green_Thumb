module DeviseHelper
  def bootstrap_alert(key)
    case key
    when "notice"
      "info"
    when "success"
      "success"
    when "warning"
      "warning"
    when "danger"
      "danger"
    end
  end
end