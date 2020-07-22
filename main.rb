require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'models/houses'
require_relative 'models/user'

enable :sessions

def logged_in?
  if session["user_id"]
    return true
  else
    return false
  end
end

def current_user
  return find_one_house_by_id(session["user_id"])
end

get '/' do
  houses = find_all_houses
  erb :index, locals: {houses: houses}
end

get '/houses/new' do
  erb :new
end

get '/houses/:id' do
  house = find_one_house_by_id(params["id"])
  erb :show, locals: {house: house}
end

post '/houses' do
  create_review(params["number_street"], params["suburb"], params["postcode"], params["image_url"], params["agent"], params["review"], current_user["id"])
  redirect '/'
end

delete '/houses/:id' do
  destroy_review(params["id"])
  redirect '/'
end

get '/houses/:id/update' do
  house = find_one_house_by_id(params["id"])
  erb :update, locals: {house: house}
end

patch '/houses/:id' do
  update_review(params["id"], params["number_street"], params["suburb"], params["postcode"], params["image_url"], params["agent"], params["review"])
  redirect "/houses/#{params["id"]}"
end

get '/users/signup' do
  erb :signup
end

post '/users' do
  create_user(params["name"], params["email"], params["password"])
  redirect '/'
end