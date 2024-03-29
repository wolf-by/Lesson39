class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    render :show
  end

  def new
  end  

  def list
    @article = Article.order(:id)
    render :list
  end 
  
  def edit
    @article = Article.find(params[:id])
    render :edit
  end  

  def update
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :text))
      flash[:success] = "Article successfully updated!"
      redirect_to article_url(@article)
    else
      flash.now[:error] = "Article update failed"
      render :edit
    end  
  end

  
 # def create
 #   render plain: params[:article].inspect
 # end 

   def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end  
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Article successfully destroyed."
    redirect_to articles_url
  end

end