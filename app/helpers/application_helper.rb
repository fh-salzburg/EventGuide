module ApplicationHelper
  def german_time(time)
    if(time == nil)
      else
      time.strftime("%d.%m.%Y %H:%M")
    end
  end

  def is_admin
    if current_user && current_user.usertype == "admin"
    return true
    else
    return false
    end
  end

  def is_guide
    if current_user && (current_user.usertype == "guide" || current_user.usertype == "admin")
    return true
    else
    return false
    end
  end

end
