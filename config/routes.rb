Rails.application.routes.draw do
  resources :news_topic_comments, :only => [:create]
  get 'news_topic_comments/:news_topic_id' => 'news_topic_comments#show_news_topic_comments',
      as: :show_news_topic_comments
  get 'like_news_topic/:news_topic_id' => 'news_topic_comments#like_news_topic', as: :like_news_topic

  # News Page
  get 'news' => 'news_page#index'
  get 'news/:news_topic_id' => 'news_page#show_news_topic', as: :show_news_topic
  get 'show_more_news_topic/:last_topic_id' => 'news_page#show_more_news_topic', as: :show_more_news_topic

  resources :news_topics
  # get 'edit_news_index' => 'news_topics#edit_index'
  # post 'edit_news_main_topic' => 'news_topics#edit_news_main_topic'
  # post 'upload_main_news_topic_image' => 'news_topics#upload_main_news_topic_image'

  post 'upload_news_topic_image' => 'news_topics#upload_news_topic_image'
  patch 'upload_news_topic_image' => 'news_topics#upload_news_topic_image'
  post 'preview_news_topic' => 'news_topics#preview_news_topic'

  get 'news_topics/show_more_news_topic/:last_topic_id' => 'news_topics#show_more_news_topic',
      as: :news_show_next_topic

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'news_page#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
