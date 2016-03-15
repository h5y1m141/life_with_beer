class Favorite < ActiveRecord::Base
  belongs_to :favoriteable, polymorphic: true
end
