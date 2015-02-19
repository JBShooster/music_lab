require 'sinatra'
require 'sinatra/activerecord'
require './models/artist'
require './models/song'

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

# song routes
get '/artists/:artist_id/songs' do
  @artist = Artist.find(params[:artist_id])
  @songs = @artist.songs
  erb :"songs/index"
end

get '/artists/:artist_id/songs/new' do
  @artist = Artist.find(params[:artist_id])
  erb :"songs/new"
end

post '/artists/:artist_id/songs' do
  artist = Artist.find(params[:artist_id])
  song = Song.create({:title => params[:song_title]})
  artist.songs << song
  redirect "/artists/#{params[:artist_id]}/songs"
end

delete '/artists/:artist_id/songs/:id' do
  artist = Artist.find(params[:artist_id])
  song = artist.songs.find(params[:id])
  song.destroy
  redirect "/artists/#{params[:artist_id]}/songs"
end
