class ArticlesController < ApplicationController

    def show
      @article = Article.find(params[:id])
    end

    def index
      @articles = Article.all
    end     


    def create
      save_params = Hash.new
      country = params[:country]
      resourcename = params[:resourcename]
      text = country + '-' + resourcename       

      save_params['title'] = text

      category = ['hadoop', 'teradata']
      new_category = []        

      category_val = ''
      for a_cat in category
        if params.has_key?(a_cat)
            new_category.push(a_cat)
        end
      end        
            
      save_params['text'] = new_category.join('|')     

      puts save_params
      @article = Article.new(save_params)

      puts "Article params"
      puts @article      

      @article.save
      redirect_to @article
    end

    def edit
        @article = Article.find(params[:id])
    end
       
    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end    
    end   
        
    private
      def article_params
        params.permit(:pet_dog, :age)
      end
end
