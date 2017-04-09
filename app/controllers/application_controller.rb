require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new_post
  end

  post '/posts' do
    name = params[:post][:name]
    content = params[:post][:content]
    @post = Post.create(name: name, content: content )
    erb :post
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :post
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit_post
  end

  patch '/posts/:id' do
    name = params[:post][:name]
    content = params[:post][:content]
    @post = Post.find(params[:id])
    @post.update name: name, content: content
    erb :post
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @name = @post.name
    @post.destroy

    erb :deleted

  end
end
