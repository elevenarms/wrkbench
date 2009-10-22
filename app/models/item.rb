class Item < ActiveRecord::Base
 belongs_to :bom
 has_attached_file :main_image, :styles => { :small => "150x150>", :large => "640x480>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  #validates_attachment_presence :main_image
  validates_attachment_size :main_image, :less_than => 5.megabytes
  validates_attachment_content_type :main_image, :content_type => ['image/jpeg', 'image/png']
end
