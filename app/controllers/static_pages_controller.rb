class StaticPagesController < ApplicationController
  def index
    @tags = Tag.all
  end
end
