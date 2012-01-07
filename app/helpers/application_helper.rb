module ApplicationHelper

  def german_time(time)
    if(time == nil)
    else
      time.strftime("%d.%m.%Y %H:%M")
    end
  end
  
  def is_admin
    if @permission == "admin"
    return true
    else
    return false
    end
  end

  def is_guide
    if @permission == "guide" || @permission == "admin"
    return true
    else
    return false
    end
  end

end
