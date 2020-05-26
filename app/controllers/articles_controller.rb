class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.save
        redirect_to articles_path
    end

    def edit
        @task = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    
    def article_params
        # *Strong params*: You need to *whitelist* what can be updated by the user
        # Never trust user data!
        params.require(:article).permit(:title, :content)
    end
end
