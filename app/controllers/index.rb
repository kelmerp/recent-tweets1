get '/' do
  erb :index
end

post '/find' do
  redirect "/#{params[:username]}"
end

get '/:username' do
  @user = TwitterUser.find_or_create_by(:username => params[:username])
  timeline = CLIENT.user_timeline(params[:username], count: 10)
  timeline.each do |tweet|
    @user.tweets << Tweet.find_or_create_by(:body => tweet.text)
  end
  erb :index
end
