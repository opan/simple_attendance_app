module Web::Controllers::Sessions
  class Create
    include Web::Action

    params do
      required(:user).schema do
        required(:username).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      authenticate
      redirect_to session[:return_to] || routes.dashboards_path
    end
  end
end
