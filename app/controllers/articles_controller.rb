class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		#render params[:article].inspect
		@article = Article.new(params[:article])
		@article.save

		if @article.save
			flash[:notice] = "Article was created"
			redirect_to article_path(@article)
		else
			render 'new'
		end

	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			# for ruby mor than 4.1
			params.require(:article).permit(:titile, :description)
		end

end
