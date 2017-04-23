class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
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
			# or render :new
		end

	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			flash[:notice] = "Article updated..."
			redirect_to article_path(@article)
		else
			render 'edit'
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
