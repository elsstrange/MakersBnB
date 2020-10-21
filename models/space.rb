class Space < ActiveRecord::Base
  def short_description(length)
    description[0..(length-1)]
  end
end
