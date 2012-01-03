class VisitorsController < BaseController
  def index
    if is_admin
      @visitors = Visitor.all(:order => "number")
      @listtitle = ""
    elsif is_guide
      @visitors = Visitor.joins(:subscription).where(["user_id = ?", session[:user_id]])
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

    else
      redirect_to root_url
    end
  end

  def destroy
  if is_guide
    visitor = Visitor.find(params[:id])
    if visitor.delete
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

end
