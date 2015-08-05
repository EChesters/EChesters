require 'rubygems'
require 'sinatra'
require 'slim'

class App < Sinatra::Application
	@page_title = ""

	get '/blog' do 
		redirect '/'
	end

	get '/about' do
		slim :'pages/index', layout: false;
	end

	get '/portfolio' do
		slim :'pages/portfolio'
	end

	get '/?*' do
		jekyll_blog(request.path) {404}
	end

	not_found do
		slim :'pages/not-found'
	end

	def jekyll_blog(path, &missing_file_block)

		file_path = File.join(File.dirname(__FILE__), 'lib/jekyll_blog/_site', path.gsub('/',''))
		file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i

		if File.exist?(file_path)
			file = File.open(file_path, "rb")
			contents = file.read
			file.close

			if (file_path.include?('.xml') || file_path.include?('.css'))
	              erb contents, :content_type => 'text/xml'
	        else
				erb contents, :layout_engine => :slim
			end
		else
			slim :'pages/not-found'
		end
	end
	
end