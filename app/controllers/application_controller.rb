require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  get '/posts/new' do
    erb :new
  end
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect to('/posts')
  end
  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end
  delete '/posts/:id/delete' do
    post=Post.find(params[:id].to_i)
    @name = post.name
    post.destroy
    erb :delete
  end
  patch '/posts/:id' do
    post = Post.find(params[:id].to_i)
    post.update(name: params[:name], content: params[:content])
    redirect to("/posts/#{post.id}")
  end
end
