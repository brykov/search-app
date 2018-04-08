SearchApp::App.controllers do

  get :index do
    render :index
  end

  get :organizations do
    render :search_form, {}, {model: Organization, action: :organizations}
  end

  post :organizations do
    criteria = params.select{ |k, v| Organization.schema.has_key?(k) and !v.empty? }
    result_set = Organization.where(criteria)
    render :search_results, {}, {result_set: result_set, model: Organization}
    #results = Organizations.find_by()
  end

  get :users do
    render :search_form, {}, {model: User, action: :users}
  end

  get :tickets do
    render :search_form, {}, {model: Ticket, action: :tickets}
  end

end
