class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    unless @article = Article.find(params[:id], I18n.locale.to_s)
      other_locale = I18n.locale.to_s == 'en' ? 'nl' : 'en'
      unless @article = Article.find(params[:id], other_locale)
        raise ActionController::RoutingError.new("Article '#{ params[:id] }' not found")
      else
        flash[:notice] = I18n.t('articles.not_available_in_this_locale')
      end
    end
  end
  
  def search
    @q = params[:q]
    @results = Article.search { |s| s.fulltext params[:q] }.results
  end

end
