class ProjectsController < ApplicationController
  require "will_paginate"
  
   PROJECT_TYPES = ["Electronic",  "Embeded", "Wearable", "Mechanical", "System"]
  
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all
    @projects = Project.paginate :page=>params[:page],  :per_page => 15
    render :template => '/projects/index', :layout => 'application'
    
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    tab :project
    @context_menu = "project_show"
    @project = Project.find(params[:id])
    @bom = Bom.find(:first, :conditions => { :project_id=>@project.id})
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    @project_types = PROJECT_TYPES
    
    render :template => '/projects/new', :layout => 'application'
    
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    
    #create bill of materials
    bom = Bom.create(:name => @project.name)
    bom.save
    @project.bom = bom
    
    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
