require_relative '../../config/environment'
require_relative '../models/Post.rb'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  get '/posts/new' do
    erb :new
  end
  post '/posts' do
    @post1 = Post.create(:name => params[:name],:content => params[:content])
    erb :index
  end
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  get '/posts/:id' do
    @post = Post.find(params[:id])
    @id =
    erb :show
  end
  get '/posts/:id/edit' do
    @id = params[:id]
    @post2 = Post.find(params[:id])
    erb :edit
  end
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :index
  end
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end
end
