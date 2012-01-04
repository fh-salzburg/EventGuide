class VisitorsController < BaseController

  def index
    if is_admin
      @visitors = Visitor.includes(:subscriptions)
      @listtitle = ""
    elsif is_guide
      @visitors = Visitor.includes(:subscriptions).where("subscriptions.guide_id = ?", session[:user_id])
      @listtitle = "Meine Gruppe"
    else
      redirect_to root_url
    end
  end

  def new
    if is_guide
      @visitor = Visitor.new
    else
      redirect_to root_url
    end
  end

  def create
    if is_guide
      visitor = Visitor.new(params[:visitor])
      if visitor.save
        flash[:notice] = "Besucher gespeichert"

        visitor_id = Visitor.last.id
        is_in_group = false
        
        if params[:isingroup]
          is_in_group = true
        end
        subscription = Subscription.new(:guide_id => session[:user_id],
                                        :visitor_id => visitor_id,
                                        :is_in_group => is_in_group
                                        )
        if not subscription.save
          flash[:error] = "Gruppenzugeh&ouml;rigkeit konnte nicht gespeichert werden"
        end
        redirect_to visitors_path
      else
        flash[:error] = "Besucher konnte nicht gespeichert werden"
        redirect_to visitors_path
      end
    else
      redirect_to root_url
    end
  end

  def edit
    if is_guide
      @visitor = Visitor.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def update
    if is_guide
      visitor = Visitor.find(params[:id])
      if visitor.update_attributes(params[:visitor])
        flash[:notice] = "Besucher editiert"
      else
        flash[:error] = "Besucher konnte nicht editiert werden"
      end
      redirect_to visitors_path
    else
      redirect_to root_url
    end
  end

  def destroy
    if is_guide
      visitor = Visitor.find(params[:id])
      if visitor.delete
        subscription = Subscription.find_by_visitor_id(params[:id])
        subscription.delete
        flash[:notice] = "Besucher gel&ouml;scht"
      else
        flash[:error] = "Besucher konnte nicht gel&ouml;scht werden"
      end
      redirect_to visitors_path
    else
      redirect_to root_url
    end
  end

  def search
    if is_guide

      else
      redirect_to root_url
    end
  end

  def give_star
    if is_guide
      visitor = Visitor.find(params[:id])
      stars = visitor.number_of_stars
      stars += 1
      visitor.update_attribute(:number_of_stars, stars)
      redirect_to visitors_url
    else
      redirect_to root_url
    end
  end
      
  def change_group_state  

  end

end
