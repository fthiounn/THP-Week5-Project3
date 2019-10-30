require 'colorize'
class GossipsController < ApplicationController
  def new
  end
  def create
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content],user: User.find(1))  # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
        redirect_to :action => 'show', notice: 'Success', :id => @gossip.id
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => 'new'
    end
  end
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: params[:id]).all
  end
  def index 
    @gossip_array = Gossip.all
  end
end