class TinymceAssetsController < ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    image = Image.new params.permit(:file, :alt, :hint)
    image.page_id = image.hint
    if image.save
      render json: {
        image: {
          url:    image.file.url,
          height: geometry.height.to_i,
          width:  geometry.width.to_i
        }
      }, layout: false, content_type: "text/html"
    else
      render json: {
        error: {
          message: 'An error has ocurred.'
        }
      }
    end
  end
end