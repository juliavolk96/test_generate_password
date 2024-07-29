Rails.application.routes.draw do
  root "passwords#new"
  post "passwords", to: "passwords#create", as: :passwords
end