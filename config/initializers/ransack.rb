# https://github.com/activerecord-hackery/ransack
# For now, if Ransack's #search method conflicts with the name of another method named search in your code or another gem, you may resolve it either by patching the extended class_method in Ransack::Adapters::ActiveRecord::Base to remove the line alias :search :ransack unless base.respond_to? :search, or by placing the following line in your Ransack initializer file at config/initializers/ransack.rb:
Ransack::Adapters::ActiveRecord::Base.class_eval('remove_method :search')
