Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
