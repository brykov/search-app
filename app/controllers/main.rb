SearchApp::App.controllers do

  get :index do
    render :index
  end

  [Organization, User, Ticket].each do |model|
    action = model.name.downcase.pluralize.to_sym

    get action do
      render :search_form, {}, {model: model, action: action}
    end

    post action do
      criteria = ConvertParamsToCriteria.run(model, params)
      result_set = model.where(criteria)
      render :search_results, {}, {result_set: result_set, model: model, criteria: criteria}
    end
  end

end
