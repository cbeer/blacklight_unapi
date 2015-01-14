Rails.application.routes.draw do
  get 'unapi', to: "catalog#unapi", as: 'unapi'
end

