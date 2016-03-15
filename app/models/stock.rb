# == Schema Information
#
# Table name: stocks
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  color      :string
#  size       :string
#  exist      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ActiveRecord::Base
  belongs_to :item
end
