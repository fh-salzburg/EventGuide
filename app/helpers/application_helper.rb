module ApplicationHelper

  def german_time(time)
    if(time == nil)
    else
      time.strftime("%d.%m.%Y %H:%M")
    end
  end
end
