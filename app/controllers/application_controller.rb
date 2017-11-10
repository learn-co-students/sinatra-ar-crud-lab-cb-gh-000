
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    get '/' do
      redirect to('/posts')
    end
  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

    patch '/posts/:id' do
      post = Post.find(params[:id].to_i)
      post.update(name: params[:name], content: params[:content])
      redirect to("/posts/#{post.id}")
    end

    delete '/posts/:id/delete' do
      post = Post.find(params[:id])
      @post_name = post.name
      post.destroy
      erb :delete
    end


end
