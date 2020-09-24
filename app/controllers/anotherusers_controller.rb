class AnotherusersController < ApplicationController
  
  layout "nosidebar"
  
  def show
    @destinyarticle = Destinyarticle.find params[:id]

  end
end
