require 'sinatra'
require 'sinatra/reloader' if development?
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
  return find_one_user_by_id(session["user_id"])
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
  return "You need an account to do that" unless logged_in?
  create_review(params["number_street"], params["suburb"], params["postcode"], params["image_url"], params["agent"], params["review"], current_user["id"])
  redirect '/'
end

delete '/houses/:id' do
  user = find_one_user_by_id(params["id"])
  house = find_one_house_by_user_id(params["user_id"])
  if  user == house
    destroy_review(params["id"])
    redirect '/'
  else
    redirect '/'
  end
end

get '/houses/:id/update' do
  house = find_one_house_by_id(params["id"])
  erb :update, locals: {house: house}
end

patch '/houses/:id' do
  user = find_one_user_by_id(params["id"])
  house = find_one_house_by_user_id(params["user_id"])
  if user == house
    update_review(params["id"], params["number_street"], params["suburb"], params["postcode"], params["image_url"], params["agent"], params["review"])
    redirect "/houses/#{params["id"]}"
  else
    redirect '/'
  end
end

get '/users/signup' do
  erb :signup
end

post '/users' do
  create_user(params["name"], params["email"], params["password"])
  redirect '/'
end

get '/session/new_sessions' do
  erb :new_sessions
end

post '/session' do
  user = find_one_user_by_email(params["email"])
  if user && BCrypt::Password.new(user["password_digest"]) == params["password"]
    session["user_id"] = user["id"]
    redirect '/'
  else
    erb :new_sessions
  end
end

delete '/session' do
  session["user_id"] = nil
  redirect '/'
end