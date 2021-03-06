Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope :api, defaults: { format: :json } do
    get '/locations/worldwide', to: 'locations#worldwide'
    get '/locations/worldwide/mangrove_data', to: 'mangrove_data#worldwide'

    resources :locations, except: [:worldwide] do
      resources :mangrove_data, except: [:worldwide]
    end

    # Import CSV
    post 'locations/import', to: 'locations#import'
    post 'locations/import_geojson', to: 'locations#import_geojson'
    post 'mangrove_data/import', to: 'mangrove_data#import'
    post 'mangrove_data/import_geojson', to: 'mangrove_data#import_geojson'
  end
end
