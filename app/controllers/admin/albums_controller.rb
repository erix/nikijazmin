class Admin::AlbumsController < Admin::AdminController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new(params[:album])
    if album.save
      flash[:success] = "Album successfully created"
      redirect_to :action => :index
    end
  end

  def show
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    if album
      album.update_attributes(params[:album])
      flash[:success] = "Album successfully updated"
    end
    redirect_to :action => :index
  end

  def destroy
    album = Album.find(params[:id])
    if album
      Album.destroy(params[:id])
      flash[:success] = "#{album.name} deleted"
    end
    redirect_to :action => :index
  end
end
