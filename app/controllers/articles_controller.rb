class ArticlesController < ApplicationController

    def new
        @country_list = Country.all
        @resource_list = Resource.all
        @category_list = Category.all
    end

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

      @category = Category.all
      categoryList = Array.new
      @category.each do |category|
        categoryList.push(category.categoryname)             
      end 
      new_category = []        

      for a_cat in categoryList
        if params.has_value?(a_cat)
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

    def country
    end

    def country_list
        #Add a country
        country_hash = Hash.new 
        input_hash = params['articles'] 
        country_hash['countryname'] = input_hash['title']
        @country = Country.new(country_hash)
        @country.save
        @country_list = Country.all
    end


    def resource
    end

    def resource_list
        #Add a resource
        resource_hash = Hash.new 
        input_hash = params['articles'] 
        resource_hash['resourcename'] = input_hash['title']
        @resource = Resource.new(resource_hash)
        @resource.save
        @resource_list = Resource.all
    end
    
    def category
    end
   
    def category_list
        #Add a category
        category_hash = Hash.new 
        input_hash = params['articles'] 
        category_hash['categoryname'] = input_hash['title']
        @category = Category.new(category_hash)
        @category.save
        @category_list = Category.all
    end

    def edit_country
        puts params
        @country = Country.find(params[:format])
    end

    def udpate_country
        @country = Country.find(params[:format]) 
                   
    end
 
end
