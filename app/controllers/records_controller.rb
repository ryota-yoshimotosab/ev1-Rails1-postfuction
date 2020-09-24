class RecordsController < ApplicationController
    
    
def create 
@destinyarticle = Destinyarticle.find params[:destinyarticle_id]
@record = Record.new(record_params) 
@record.user_id = current_user.id
if @record.save 
redirect_to destinyarticle_path(@destinyarticle)
else 
redirect_to destinyarticle_path(@destinyarticle)
end
end    
    
    
def destroy 
@destinyarticle = Destinyarticle.find params[:destinyarticle_id]
@record = @destinyarticle.records.find(params[:id])
@record.destroy
redirect_to destinyarticle_path(@destinyarticle)
end 
    
    
 def record_params
params.require(:record).permit(:user_id, :destinyarticle_id, :content)
 end 
 
end
