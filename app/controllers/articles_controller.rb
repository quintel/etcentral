class ArticlesController < ApplicationController

  def index
    @articles = Article.all.select { |article| article.lang == I18n.locale.to_s }
    @issues = @articles.select { |article| article.scrubbed_section == "faq" }
    @sections = @articles.collect { |article| article.scrubbed_section }.uniq.delete_if { |section| section.blank? || section == "faq"}
  end

  def show
    unless @article = Article.find(params[:id], I18n.locale.to_s)
      other_locale = I18n.locale.to_s == 'en' ? 'nl' : 'en'
      current = Article.find(params[:id], other_locale)
      unless @article = Article.find_similar(current, I18n.locale.to_s)
        @article = current
        flash[:notice] = I18n.t('articles.not_available_in_this_locale')
      end
    end
  end
  
  def search
    @q = params[:q]
    @query = Article.search do
      fulltext params[:q]
    end
    @results = @query.results.select { |result| result.lang == I18n.locale.to_s }
  end

end
