require 'sinatra'
require 'sinatra/activerecord'
require './models/artist'

get '/' do
  redirect '/artists'
end

# artist routes
get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/artists/new' do
  erb :"artists/new"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

post '/artists' do
  Artist.create({:name => params[:artist_name]})
  redirect '/artists'
end

put '/artists/:id' do
  id = params[:id]
  artist = Artist.find(id)
  artist.name = params[:artist_name]
  artist.save
  redirect "/artists/#{id}"
end

delete '/artists/:id' do
  artist = Artist.find(params[:id])
  artist.destroy
  redirect '/artists'
end
