get '/profiles/:id', auth: :user do
  @user=User.find(params[:id])
  erb :profile
end
