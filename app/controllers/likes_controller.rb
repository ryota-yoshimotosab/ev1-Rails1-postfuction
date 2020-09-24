class LikesController < ApplicationController

before_action :authenticate_user!

def create 
@destinyarticle = Destinyarticle.find params[:destinyarticle_id]
@like = Like.new(like_params)
@like.user_id = current_user.id 
    
if @like.save 
redirect_to destinyarticle_path(@destinyarticle)
else 
redirect_to destinyarticle_path(@destinyarticle)
end   
    
end
    
  
def destroy 
@destinyarticle = Destinyarticle.find params[:destinyarticle_id]
@like = Like.find_by(user_id: current_user.id)
@like.destroy 
redirect_to destinyarticle_path(@destinyarticle)
end 
  
    
    
def like_params 
params.require(:like).permit(:user_id, :destinyarticle_id)
end 
    
end
