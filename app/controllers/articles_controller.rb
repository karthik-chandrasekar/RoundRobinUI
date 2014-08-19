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

       @country = Country.all
       @country_hash = Hash.new
       
       @country.each do |country|
        cname = country.countryname
        @country_hash[cname] = @my_val.include?cname
       end

        
       @resource  = Resource.all
       @resource_hash = Hash.new
        
       @resource.each do |resource|
        rname = resource.resourcename
        @resource_hash[rname] = @my_val.include?rname
       end 
       
       @category = Category.all
       @category_hash = Hash.new

       @category.each do |category|  
        catname = category.categoryname
        @category_hash[catname] = @my_val.include?catname
       end        

    end
       
    def update
      @article = Article.find(params[:id])

      save_params = Hash.new
      country = params[:country]
      resourcename = params[:resourcename]
      text = country + '-' + resourcename       

      save_params['title'] = text

      @category = Category.all
      category_list = Array.new
      @category.each do |category|
        category_list.push(category.categoryname)        
      end  
      new_category = []        

      for a_cat in category_list
        if params.has_key?(a_cat)
            new_category.push(a_cat)
        end
      end        
            
      save_params['text'] = new_category.join('|')     

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

    def delete_country
        @country = Country.find(params[:format])
        @country.destroy
        
        redirect_to new_article_path
    end


    def delete_resource
        @resource = Resource.find(params[:format])
        @resource.destroy

        redirect_to new_article_path
    end

    def delete_category
        @category = Category.find(params[:format])
        @category.destroy

        redirect_to new_article_path
    end

    def add_country
        #Add a country
        country_hash = Hash.new 
        input_hash = params['articles'] 
        country_hash['countryname'] = input_hash['title']
        @country = Country.new(country_hash)
        @country.save
        @country_list = Country.all
    end

    def country
    end

    def country_list
        #Add a country
        @country_list = Country.all
    end

    def resource
    end

    def add_resource
        #Add a resource
        resource_hash = Hash.new 
        input_hash = params['articles'] 
        resource_hash['resourcename'] = input_hash['title']
        @resource = Resource.new(resource_hash)
        @resource.save
        @resource_list = Resource.all

        redirect_to articles_resource_list_path
    end

    def resource_list
        @resource_list = Resource.all
    end
    
    def category
    end
  
    def add_category
        #Add a category
        category_hash = Hash.new 
        input_hash = params['articles'] 
        category_hash['categoryname'] = input_hash['title']
        @category = Category.new(category_hash)
        @category.save
        @category_list = Category.all
        
        redirect_to articles_category_list_path
    end
 
    def category_list
        @category_list = Category.all
    end

    def edit_country
        puts params
        @country = Country.find(params[:format])
        @countryname = @country.countryname
     end

    def udpate_country
        @country = Country.find(params[:format]) 
                   
    end

    def edit_resource
        @resource = Resource.find(params[:format])
        
    end

    def show_availresource
        @availresource = AvailResource.all
    end

    def new_availresource
        @availKeys = ['INDIAExceptionHandler', 'CHINAExceptionHandler', 'USAExceptionHandler', 'UnAvailableResources']
        @resource = Resource.all        

    end
    
    def add_availresource
        params_hash = Hash.new
        params_hash['key'] = params[:title]

        @resource = Resource.all
        selected_resource = []
        
        @resource.each do |resource|
            if params.has_key?(resource.resourcename)
                selected_resource.push(resource.resourcename)
            end
        end

        params_hash['value'] = selected_resource.join('|')
        puts params_hash
        @availresource = AvailResource.new(params_hash)
        @availresource.save

        redirect_to articles_show_availresource_path
    end 

    def delete_availresource
        @resource = AvailResource.find(params[:format])
        @resource.destroy

        redirect_to articles_show_availresource_path
    end
end
