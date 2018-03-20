class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		article = Article.new(article_params)
		if article.save
			redirect_to "/articles/#{article.id}"
		else
			render "/articles/new"
		end

	end

	


	def update
		article = Article.find(params[:id])
		new_one = params[:article][:content]
		article = Article.new()
		article.content  = article.content.concat(new_one)
		if article.save

			redirect_to '/'
		else
			render "/articles/#{article.id}"
		end
	end

	private

	

	def article_params
		params.require(:article).permit(:title, :content)
	end
end
