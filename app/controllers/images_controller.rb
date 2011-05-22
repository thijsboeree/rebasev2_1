class ImagesController < ApplicationController
   def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      render :json => { :pic_path => @image.image.url.to_s , :name => @image.image.instance.attributes["image_file_name"] }, :content_type => 'text/html'
    else
      #todo handle error
      render :json => { :result => 'error'}, :content_type => 'text/html'
    end
  end
  
  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to root_path
    end
  end

  def show_pic
    @image = current_image
    geo = Paperclip::Geometry.from_file(@image.image.to_file(:original))
    @adapter = geo.width > Image::MAX_CROP_WIDTH.to_f ? geo.width/Image::MAX_CROP_WIDTH.to_f : 1
    @width = geo.width
    @height = geo.height
  end

  def show_crop
    @image = current_image
  end
  
  def current_image
    Image.last #to change according to what you expect, example: current_user.avatar
  end

end
