class ArticletwosController < ApplicationController
   
    def new
    end
 
    def index
        @articletwos = Articletwo.all
    end

    def show
        @articletwos = Articletwo.find(params[:id])
    end

    def create
        @articletwo = Articletwo.new(article_params)
        @articletwo.save
        redirect_to @articletwo
    end

    def edit
        @articletwo = Articletwo.find(params[:id])
    end 

    def update
        @articletwo = Articletwo.find(params[:id])
                
        if @articletwo.update(article_params)
            redirect_to @articletwo
        else
            render 'edit'
        end
    end
   
    private
        def article_params
            params.require(:article).permit(:key, :value)
        end

    def destroy
        @article = Articletwo.find(params[:id])
        @article.destroy

        redirect_to articletwos_path
    end
 
end
