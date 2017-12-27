require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    id = params[:id]
    @post = Post.find(id)
    erb :post
    # "#{}"
  end

  get '/posts/:id/edit' do
    id = params[:id]
    @post = Post.find(id)
    erb :post_edit
    # "#{}"
  end

  patch 'posts/:id' do
    id = params[:id]
    @post = Post.find(id)
    @post.update(name: params[:name], content: params[:content])
    erb :post
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :post
  end
end
