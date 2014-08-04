Rails.application.routes.draw do

  resources :events do
    resources :activity_logs, except: [:index, :show, :destroy]
  end

  get '/logout' => -> env { [200, { 'Content-Type' => 'text/html' }, ['Rack::CAS should have caught this']] }, as: :logout

  root to: 'events#index'
end
