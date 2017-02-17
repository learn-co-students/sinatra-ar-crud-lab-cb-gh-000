require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # C - Create
  get '/posts/new' do 
    erb :new
  end

  post '/posts' do
    post = Post.new(params)
    post.save
    redirect to "/posts"
  end

  # R - Read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # U - Update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    
    redirect to "/posts/#{post.id}"
  end

  # D - Delete
  delete '/posts/:id' do
    post = Post.find(params[:id])
    @post = post
    post.destroy

    erb :deleted
  end
end