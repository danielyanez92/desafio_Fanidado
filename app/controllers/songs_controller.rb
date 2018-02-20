class SongsController < ApplicationController
before_action :set_resources, except: :create
  def create
    @playlist= Playlist.find(params[:playlist_id])
    @song = Song.new(song_params)
    @song.playlist = @playlist
    @song.save
    redirect_to @playlist
  end
  def destroy
    @song.destroy
    if @song.destroy
      redirect_to @playlist, notice: 'La Cancion ha sido eliminada con exito'
    else
      redirect_to @playlist, notice: 'La Cancion no se ha podido eliminar'
    end
  end
  private

  def set_resources
    @playlist= Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist)
  end

end
