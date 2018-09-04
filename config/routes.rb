Rails.application.routes.draw do
  mount API => '/'

  ActiveAdmin.routes(self)
end
