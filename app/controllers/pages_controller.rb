class PagesController < ApplicationController

  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
  @header = "This is the welcome page!!!"
  end

  def contest
  @header = "This is the contest page!!!"
  redirect_to welcome_path
  end

  def about
  @header = "This is the about page!!!"
  end

  def kitten
  end

  def kittens
  end

  def set_kitten_url
  requested_size = params[:size]
  @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to welcome_path
  end

  def secrets
    if params[:magic_word] == "xxx"
      render :secrets
    else
      flash[:alert] = ":( Sorry, you are not authorized to view this page"
      redirect_to welcome_path
    end
  end


end
