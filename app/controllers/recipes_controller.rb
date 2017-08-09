require 'pry'
class RecipesController < ApplicationController

  get '/recipes' do
  	@recipes = Recipe.all
  	erb :'recipes/index'
  end

  post '/recipes' do 
  	@recipe = Recipe.new
  	@recipe.name = params[:name]
  	@recipe.ingredients = params[:ingredients]
  	@recipe.cook_time = params[:cook_time]
  	@recipe.save

  	redirect "/recipes/#{@recipe.id}"
  end	

  get '/recipes/new' do
		erb :'recipes/new'
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find_by(id: params[:id])
  	erb :'recipes/edit'
  end

  delete '/recipes/:id/delete' do 
  	@recipe = Recipe.find_by(id: params[:id])
  	@recipe.destroy
  	redirect '/recipes'
  end

  get '/recipes/:id' do
		@recipe = Recipe.find_by(id: params[:id])
		erb :'recipes/show'
  end

  patch '/recipes/:id' do
  	# binding.pry
  	@recipe = Recipe.find_by(id: params[:id])
  	@recipe.name = params[:name]
  	@recipe.ingredients = params[:ingredients]
  	@recipe.cook_time = params[:cook_time]
  	@recipe.save
  	
  	redirect "recipes/#{@recipe.id}"
  end

end