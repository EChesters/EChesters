require 'rubygems'
require 'sinatra'
require 'slim'

class App < Sinatra::Application
	get '/' do
		slim :'pages/index'
	end
end