class BomsController < ApplicationController
  # GET /boms
  # GET /boms.xml
  def index
    @boms = Bom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boms }
    end
  end

  # GET /boms/1
  # GET /boms/1.xml
  def show
    @bom = Bom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bom }
    end
  end

  # GET /boms/new
  # GET /boms/new.xml
  def new
    @bom = Bom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bom }
    end
  end

  # GET /boms/1/edit
  def edit
    @bom = Bom.find(params[:id])
  end

  # POST /boms
  # POST /boms.xml
  def create
    @bom = Bom.new(params[:bom])

    respond_to do |format|
      if @bom.save
        flash[:notice] = 'Bom was successfully created.'
        format.html { redirect_to(@bom) }
        format.xml  { render :xml => @bom, :status => :created, :location => @bom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boms/1
  # PUT /boms/1.xml
  def update
    @bom = Bom.find(params[:id])

    respond_to do |format|
      if @bom.update_attributes(params[:bom])
        flash[:notice] = 'Bom was successfully updated.'
        format.html { redirect_to(@bom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boms/1
  # DELETE /boms/1.xml
  def destroy
    @bom = Bom.find(params[:id])
    @bom.destroy

    respond_to do |format|
      format.html { redirect_to(boms_url) }
      format.xml  { head :ok }
    end
  end
end
