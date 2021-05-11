class ArticlesController < ApplicationController
  #load_and_authorize_resource
  before_action :set_article, only: %i[ show edit update destroy ]
    def index
      @articles = Article.all
      render :json => @articles
    end
   
    def show
      @article = Article.find(params[:id])
      #authorize! :read, @article

    end
   
    def new
      @article = Article.new
    end
   
    def edit
      @article = Article.find(params[:id])
    end
   
    def create
      @article = Article.new(article_params)
      @article.userid=current_user.id

      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end
   
    def update
      @article = Article.find(params[:id])
   
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
   
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
   
      redirect_to articles_path
    end
   
    private
    def set_article
      @article = Article.find(params[:id])
      end
      def article_params
        params.require(:article).permit(:title, :text)
      end
      
  end
