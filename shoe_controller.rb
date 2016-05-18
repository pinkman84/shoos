require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('./models/shoe')

get '/home' do
  erb( :home )
end

get '/shoes/new' do
  erb( :new )
end

get '/shoes' do
  @shoe = Shoe.all()
  # binding.pry
  erb(:index)
end

post '/shoes' do
  @shoe = Shoe.new(params)
  @shoe.save
  erb( :create )
end