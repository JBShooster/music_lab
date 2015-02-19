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
  redirect '/artist'
end

get '/artist' do
  @artist = Artist.all
  erb :index
end

get '/artist/:id' do
  @artist = Artist.find params[:id].to_i 
  erb :show
end


get '/artist/new' do
  erb :add
end

get '/artist/:id/edit' do
  @artist = Artist.find params[:id].
  erb :edit
end

post '/artist' do
  Artist.create params
  redirect '/artist'
end

put '/artist/:id' do
  m = Artist.find(params[:id].to_i)
  m.name = params[:name]
  m.save
  redirect '/artist'
end

delete '/artist/:id' do
  Artist.find(params[:id].to_i).destroy
  redirect '/artist'
end