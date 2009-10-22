class Bom < ActiveRecord::Base
  belongs_to :project
  has_many :items, :dependent => :delete_all
  
end
