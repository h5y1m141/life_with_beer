# == Schema Information
#
# Table name: item_reviews
#
#  id            :integer          not null, primary key
#  resource_id   :integer
#  resource_type :string
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ItemReview < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
end
