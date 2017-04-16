class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		#render params[:article].inspect
		@article = Article.new(params[:article])
		@article.save

		redirect_to articles_show(@article)
	end

	private
		def article_params
			# for ruby mor than 4.1
			params.require(:article).permit(:titile, :description)
		end

end
