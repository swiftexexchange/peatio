# encoding: UTF-8
# frozen_string_literal: true

Dir['app/models/deposits/**/*.rb'].each { |x| require_dependency x.split('/')[2..-1].join('/') }
Dir['app/models/withdraws/**/*.rb'].each { |x| require_dependency x.split('/')[2..-1].join('/') }

class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Peatio::Application.routes.draw do
  draw :admin
  get  '/tos' => 'static_pages#tos', as: 'tos'
  get  '/faq' => 'static_pages#faq', as: 'faq'
  get  '/listing' => 'static_pages#listing', as: 'listing'
  get  '/delisting' => 'static_pages#delisting', as: 'delisting'
  get  '/status' => 'static_pages#status', as: 'status'
  
  get '/swagger', to: 'swagger#index'

  mount API::Mount => API::Mount::PREFIX
end
