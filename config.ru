require 'sinatra/base'
require 'sinatra/activerecord'

require './controllers/ApplicationController'
require './controllers/ItemController'
require './controllers/UserController'


#models
require'./models/ItemModel'
require './models/UserModel'


map('/'){run ApplicationController}
map('/'){run ItemController}
map('/user'){run UserController}