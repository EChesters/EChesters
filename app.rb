require 'rubygems'
require 'sinatra'
require 'slim'

class App < Sinatra::Application
	get '/' do
		slim :'pages/index', layout: false;
	end

	get '/blog' do
		slim :'pages/blog'
	end

	get '/portfolio' do
		slim :'pages/portfolio'
	end
end