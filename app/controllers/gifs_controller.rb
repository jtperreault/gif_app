class GifsController < ApplicationController

  before_action :set_gif, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create, :destroy]

  def show
  end

  def edit
  end

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)

    if @gif.save
      redirect_to @gif, notice: "Gif saved successfully!"
    else
      render :new
    end
  end

  def update
    if @gif.update(gif_params)
      redirect_to @gif, notice: "Gif updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @gif.destroy
    redirect_to gifs_url, notice: "Gif destroyed successfully."
  end

private

  def gif_params
    params.require(:gif).permit(
      :title,
      :url,
      :tag_list
    )
  end

  def set_gif
    @gif = Gif.find(params[:id])
  end

end

