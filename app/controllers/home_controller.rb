class HomeController < ApplicationController
  def index
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @items }
     end
   end
end
