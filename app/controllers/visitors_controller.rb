class VisitorsController < BaseController
  before_filter :is_guide?
  def index
    @visitors = Visitor.includes(:subscriptions).where("subscriptions.guide_id = ? AND subscriptions.is_in_group = ?", session[:user_id], true)
  end

  def new
    @visitor = Visitor.new
  end

  def create
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
  end

  def edit
    @visitor = Visitor.find(params[:id])
  end

  def update
    visitor = Visitor.find(params[:id])
    if visitor.update_attributes(params[:visitor])
      flash[:notice] = "Besucher editiert"
    else
      flash[:error] = "Besucher konnte nicht editiert werden"
    end
    redirect_to visitors_path
  end

  def destroy
    visitor = Visitor.find(params[:id])
    if visitor.delete
      subscription = Subscription.find_by_visitor_id(params[:id])
      subscription.delete
      flash[:notice] = "Besucher gel&ouml;scht"
    else
      flash[:error] = "Besucher konnte nicht gel&ouml;scht werden"
    end
    redirect_to visitors_path
  end

  def search
    @visitor = Visitor.includes(:subscriptions).where("visitors.number = ?", params[:searchValue])
    if @visitor.count > 0
    @success = true
    else
    @success = false
    end
  end

  def give_star
    visitor = Visitor.find(params[:id])
    stars = visitor.number_of_stars
    stars += 1
    visitor.update_attribute(:number_of_stars, stars)
    redirect_to visitors_url
  end

  def add_to_group
    visitor = Visitor.includes(:subscriptions).where("subscriptions.visitor_id = ? AND subscriptions.guide_id = ?", params[:id], session[:user_id])

    if visitor.count > 0
      visitor.each do |v|
        v.subscriptions.each do |s|
          if s.guide_id == session[:user_id]
            s.update_attribute(:is_in_group, true)
            flash[:notice] = "Besucher wurde zur Gruppe hinzugef&uuml;gt"
          break;
          end
        end
      end
    else
      subscription = Subscription.new(:guide_id => session[:user_id],
      :visitor_id => params[:id],
      :is_in_group => true
      )
      if subscription.save
        flash[:notice] = "Besucher wurde zur Gruppe hinzugef&uuml;gt"
      else
        flash[:error] = "Besucher konnte nicht hinzugef&uuml;gt werden"
      end
    end
    redirect_to visitors_url
  end

  def delete_from_group
    visitor = Visitor.includes(:subscriptions).where("subscriptions.visitor_id = ? AND subscriptions.guide_id = ?", params[:id], session[:user_id])

    visitor.each do |v|
      v.subscriptions.each do |s|
        if s.guide_id == session[:user_id]
          s.update_attribute(:is_in_group, false)
          flash[:notice] = "Besucher wurde aus der Gruppe entfernt"
        break;
        end
      end
    end
    redirect_to visitors_url
  end

end
