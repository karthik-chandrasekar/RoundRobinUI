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

       @my_val = @article.text.split('|')
       @my_val2 = @article.title.split('-')
       @my_val.concat(@my_val2)

       @us = @my_val.include?'UnitedStates'
       @india = @my_val.include?'India'
       @china = @my_val.include?'China'
     
       @sscaria = @my_val.include?'sscaria' 
       @nimathur = @my_val.include?'nimathur'
       
       @hadoop = @my_val.include?'hadoop'
       @teradata = @my_val.include?'teradata'
       
    end
       
    def update
      @article = Article.find(params[:id])

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
         

      if @article.update(save_params)
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
        
end
