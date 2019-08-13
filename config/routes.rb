Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'user', to: 'users#show_by_mail'

  get 'users/:user_id/offers', to: 'offers#index'
  get 'offers/:id', to: 'offers#show'
  put 'offers/:offer_id/accept', to: 'offers#accept'
  put 'offers/:offer_id/reject', to: 'offers#reject'
end
