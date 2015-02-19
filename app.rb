require 'sinatra'
require 'better_errors'
require 'pg'
require 'pry'
require 'sinatra/activerecord'
require './models/artist'

configure :development do 
  use BetterErrors:: Middleware
  BetterErrors.application_root = __dir__
end


get '/' do
  redirect '/artists'
end

get '/artists' do
  @artist = Artist.all
  erb :index
end

get '/artists/new' do
  erb :new
end

get '/artists/:id' do
  @artist = Artist.find params[:id].to_i 
  erb :show
end

get '/artists/:id/edit' do
  @artist = Artist.find params[:id].to_i
  erb :edit
end

post '/artists' do
  Artist.create params
  redirect '/artists'
end

put '/artists/:id' do
  m = Artist.find(params[:id].to_i)
  m.name = params[:name]
  m.save
  redirect '/artists'
end

delete '/artists/:id' do
  Artist.find(params[:id].to_i).destroy
  redirect '/artists'
end