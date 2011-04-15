class Image < ActiveRecord::Base
 
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_image, :if => :cropping?

  belongs_to :question
  has_attached_file :image,
                    :styles => {
                      :thumb => ["100x100", :jpg],
                      :pagesize => ["500x400", :jpg],
                      :large => ["500x500>", :jpg],
                    },
                    :default_style => :pagesize,
                    :url  => "/images/:style/:id/:basename.:extension",
                    :path => ":rails_root/public/images/:style/:id/:basename.:extension"

  
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  private
  
  def reprocess_image
    image.reprocess!
  end


 




end
