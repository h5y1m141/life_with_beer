module ArticleSearchModule
  def search_articles_by_parameters(query_parameter)
    Article.order("updated_at DESC")
      .ransack(query_parameter)
  end
end
