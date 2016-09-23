Rails.application.routes.draw do

  root 'static_pages#landing_page'

  get 'popular_purchases', to: 'purchases#popular_purchases_index'

  get '/*foo', to: redirect('/')

end
