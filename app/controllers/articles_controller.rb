class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @article = Article.new
    end
    
    def edit
    end
    
    def create
        @article = Article.new(ar_prms)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfuly created!"
            redirect_to article_path(@article)
        else
            render :new
        end
    end
    
    def update
        if @article.update(ar_prms)
            flash[:success] = "Article was successfuly Updated!"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    def show
    end
    
    def destroy
        @article.destroy
        flash[:danger] = "Article was successfuly Deleted!"
        redirect_to articles_path
    end
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def ar_prms
       params.require(:article).permit(:title, :description) 
    end
end