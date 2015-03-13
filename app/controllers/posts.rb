

get '/index', auth: :user do
  @posts = Post.all
  erb :posts
end


get '/posts', auth: :user do
  @posts = Post.all
  erb :posts
end

get '/posts/new', auth: :user do
  erb :new_post
end

get '/posts/:id/edit', auth: :user do |id|
  @post = Post.find(id)
  erb :update, layout: false
end

get '/posts/:id', auth: :user do
  @post = Post.find(params[:id])
  erb :post
end

delete '/posts/:id', auth: :user do |id|
  Post.destroy(id)
end

post '/posts', auth: :user do
  @user = current_user
  @post = @user.posts.create(name: params[:name], location: params[:location], crime: params[:crime], bounty: params[:bounty],pic_url: params[:pic_url],tagline: params[:tagline])
  redirect "/posts/#{@post.id}"
end

put '/posts/:id', auth: :user do
  id = params[:id]
  @post = Post.find(id)
  @post.update(id: id, user_id: current_user.id, name: params[:name], location: params[:location], crime: params[:crime], bounty: params[:bounty],pic_url: params[:pic_url],tagline: params[:tagline])
 redirect "/posts"
end

post '/post/new', auth: :user do
    @post = Post.create(name: params[:name], location: params[:location], crime: params[:crime], bounty: params[:bounty],pic_url: params[:pic_url],tagline: params[:tagline])
  redirect "/posts"
end
