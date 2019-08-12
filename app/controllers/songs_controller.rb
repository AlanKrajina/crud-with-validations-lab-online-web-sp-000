class SongsController < ApplicationController
    
  def index
    @songs = Song.all
  end
  
  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    binding.pry
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end
  
  private
  
  def song_params(*args)
	  params.require(:post).permit(*args)
	end
  
#  def song_params
#    params.permit(:title, :released, :release_year, :artist_name, :genre)
#  end
end

=begin
3] pry(#<SongsController>)> @song = Song.new(song_params)
Unpermitted parameters: utf8, authenticity_token, song, commit
=> #<Song:0x00007fe921cdd888
 id: nil,
 title: nil,
 released: nil,
 release_year: nil,
 artist_name: nil,
 genre: nil,
 created_at: nil,
 updated_at: nil>
[4] pry(#<SongsController>)> song_params
Unpermitted parameters: utf8, authenticity_token, song, commit

=end