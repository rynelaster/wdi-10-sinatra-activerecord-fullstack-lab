class ItemController < ApplicationController

	get '/' do
		# "We have Item control"
		@items = Item.all?
		@items.to_json
		erb :item_index
 	end
 	#add route
	get '/add' do
		@page = "Add Items"
		@aciton = "/items/add"
		@method = "POST"
		@placeholder = "I AM HUNGRY"
		@value = ""
		@buttontext = "Add It"
		erb :add_item
	end
	#add route
	post '/add' do
		pp params

		@item = Item.new
		@item.title = patams[:title]
		@item.user_id = 1
		@item.save

		session[:message] = "You added item #{@item.id}."

		# @item.to_json
		redirect '/items'
	end
	#delete route
	delete '/:id' do
		@item = Item.find params[:id]
		@item.delete

		session[:message] = "You deleted item #{@item.id}."
		redirect '/items'

	end
	# edit route
	get '/edit/:id' do
		@item = Item.find params[:id]
		@page = "Edit Item #{@item.id}" #why am i using interpolation here?  try with concatenation and see what happens.
		erb :edit_item
	end

	# update route
	patch '/:id' do
		# like i said -- lots of ways to do this.  
		# http://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html
		# http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-where
		@items = Item.find params[:id] 

		# note: .where method gives us an array (Why?). So we must index. 
		# Might there have been a more appropriate query method to use 
		# instead of .where ?
		@item = @items[0]

		@item.title = params[:title]
		@item.save

		session[:message] = "You updated item #{@item.id}."
		redirect '/items'
end

end