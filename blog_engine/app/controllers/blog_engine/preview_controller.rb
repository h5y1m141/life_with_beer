require_dependency "blog_engine/application_controller"

module BlogEngine
  class PreviewController < ApplicationController
    def edit
      @article = Article.find(params[:id])
    end
  end
end
