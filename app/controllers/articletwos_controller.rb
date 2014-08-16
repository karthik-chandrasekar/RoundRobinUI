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
        
        params_hash = Hash.new
        articles_hash = params[:articletwos]
        params_hash['key'] = articles_hash[:title]
        params_hash['value'] = articles_hash[:text]

        @articletwo = Articletwo.new(params_hash)
        @articletwo.save
        redirect_to @articletwo
    end

    def edit
        @articletwo = Articletwo.find(params[:id])
    end 

    def update
        @articletwo = Articletwo.find(params[:id])
             
        params_hash = Hash.new
        articles_hash = params[:articletwo]
        params_hash['key'] = articles_hash[:key]
        params_hash['value'] = articles_hash[:value]
   
        if @articletwo.update(params_hash)
            redirect_to @articletwo
        else
            render 'edit'
        end
    end
   
    def destroy
        @article = Articletwo.find(params[:id])
        @article.destroy

        redirect_to articletwos_path
    end
 
end
