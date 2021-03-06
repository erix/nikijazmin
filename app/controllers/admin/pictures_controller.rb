class Admin::PicturesController < ApplicationController
  before_filter :authorize
  respond_to :json, :html

  def index
    @pictures = Album.find(params[:album_id]).pictures
    files = @pictures.map {|p| p.to_jq_upload}
    respond_with :files => files do |format|
      format.html { render :layout => !request.xhr? }
    end
  end

  def show
    respond_with Picture.find(params[:id])
  end

  def create
    picture = Picture.new(params[:picture])
    album = Album.find(params[:album_id])
    album.pictures << picture
    respond_with({ :files => [picture.to_jq_upload] }, :location => album_picture_path(picture.album_id, picture))
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    picture.clear #delete the associated image file
    render nothing: true, status: :ok
  end
end
