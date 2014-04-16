require 'sinatra'
require 'sinatra/activerecord'
require 'open-uri'

set :database, "sqlite3:///favorite_gems.db"


get "/" do
  @gems = GemKeeper.all
  erb :"gem_keeper/index"
end

post "/gems" do
  clean_params = GemKeeper.launder_params(params)
  #GemKeeper.check_url(params[:url])
  if clean_params.length == 0
    redirect '/error'
  else
    gem = GemKeeper.new(clean_params)
    if gem.save
      redirect '/'
    else
      redirect '/temp'
    end
  end
end

get "/gems/:id" do
  @gem = GemKeeper.find(params[:id])
  erb :"gem_keeper/show"
end

put "/gems/:id" do
  #GemKeeper.check_url(params[:url])
  gem = GemKeeper.find(params[:id])
  clean_params = GemKeeper.launder_params(params)
  if clean_params.length == 0
    redirect '/error'
  else
    if gem.update(clean_params)
      redirect "/gems/#{params[:id]}"
    else
      redirect "/"
    end
  end
end

delete "/gems/:id" do
  gem = GemKeeper.find(params[:id])
  if gem.delete
    redirect "/"
  else
    redirect "/gems/#{params[:id]}"
  end
end

get "/error" do
  "You can't just submit a bunch of blanks."
end

get "/zen" do
  erb :"gem_keeper/zen"
end






class GemKeeper < ActiveRecord::Base

  def self.launder_params(params)
    edit_params = {name: params[:name], description: params[:description], url: params[:url]}
    clean_params = edit_params.select { |k, v| v != '' }
  end

  def self.check_url(address)
    address =~ URI::regexp(["ftp", "http", "https"])
  end

end



  








