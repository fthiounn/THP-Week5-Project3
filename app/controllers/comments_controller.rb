class CommentsController < ApplicationController
  def show
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    @comment = Comment.new('content' => params[:content],user: User.find(1), gossip: Gossip.find(params[:gossip_id]))
    if @comment.save
        redirect_to :controller => 'gossips', :action => 'show', notice: 'Success', :id => params[:gossip_id]
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      redirect_to :action => 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    comment_param = params.require(:comment).permit(:content)
    if @comment.update(comment_param)
      redirect_to :controller => 'gossips',action: 'show', notice: 'Success', :id => params[:gossip_id]
    else
      redirect_to :action => 'edit'
    end
  end

  def destroy
  end
end
