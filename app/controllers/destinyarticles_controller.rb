class DestinyarticlesController < ApplicationController
  
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  
  layout "nosidebar"
  
  def index
    @destinyarticles = Destinyarticle.page(params[:page]).per(5)
 if params[:tag_id].present?
   @tag = Tag.find(params[:tag_id])
   @destinyarticles = @tag.destinyarticles
   .page(params[:page]).per(5).where("title LIKE ?", "%#{params[:title]}%")
   if params[:orderselect] == "old" 
    @destinyarticles = @tag.destinyarticles
   .page(params[:page]).per(5).where("title LIKE ?", "%#{params[:title]}%").order(created_at: :ASC)
   elsif params[:orderselect] == "new"
         @destinyarticles = @tag.destinyarticles
   .page(params[:page]).per(5).where("title LIKE ?", "%#{params[:title]}%").order(created_at: :DESC)

  end 
   
   
   elsif params[:tag_id].present? == !present?
     @destinyarticles = Destinyarticle.page(params[:page]).per(5).where("title LIKE ?", "%#{params[:title]}%")
     if params[:orderselect] == "old"
            @destinyarticles = Destinyarticle.page(params[:page]).per(5)
            .where("title LIKE ?", "%#{params[:title]}%").order(created_at: :ASC)
    elsif params[:orderselect] == "new"
     @destinyarticles = Destinyarticle.page(params[:page]).per(5)
            .where("title LIKE ?", "%#{params[:title]}%").order(created_at: :DESC)
    elsif params[:orderselect] == "popular"
      @destinyarticles = Destinyarticle.page(params[:page]).per(5)
            .where("title LIKE ?", "%#{params[:title]}%").joins(:likes).group(:destinyarticle_id).order("count(destinyarticle_id) desc")
              
    end 
end 
    
    
    
    
    
    
    
  end
# /////////////////////////


  def show
    @destinyarticle = Destinyarticle.find params[:id]
@record = Record.new
  @like = Like.new
  end

  def new
    @destinyarticle = Destinyarticle.new
  end


def create 
  @destinyarticle = Destinyarticle.new(destinyarticle_params)
  if @destinyarticle.save 
    redirect_to destinyarticle_path(@destinyarticle)
  else 
    render "new"
  end
  
  
  
end 


  def edit
    @destinyarticle = Destinyarticle.find params[:id]
  end

def update 
  @destinyarticle = Destinyarticle.find params[:id]
  if @destinyarticle.update(destinyarticle_params)
    redirect_to destinyarticle_path(@destinyarticle)
  else 
    render "show"
  end 
    
end 
  
def destroy 
  @destinyarticle = Destinyarticle.find params[:id]
  @destinyarticle.destroy
  redirect_to destinyarticles_path
end 
  
  
  
  
def destinyarticle_params
  params.require(:destinyarticle).permit(:title, :text, :articleimage, :orderselect, :user_id, tag_ids: [])
end 
  
  
  
end
