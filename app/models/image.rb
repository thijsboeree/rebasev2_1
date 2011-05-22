class Image < ActiveRecord::Base

 after_update :reprocess_image, :if => :cropping?
  
  has_attached_file :image, :styles => { :thumb =>  { :geometry => 'x60',
                                                         :quality => 70,
                                                         :format => 'JPG'}
                                       }
  
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => [ 'image/jpeg', 'image/png', 'image/pjpeg' ]
  
  MAX_CROP_WIDTH = 500
  PREVIEW_WIDTH  = 100
  PREVIEW_HEIGHT = 100



end
