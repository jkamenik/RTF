class TestedFeaturesController < ApplicationController
  # GET /tested_features
  # GET /tested_features.xml
  def index
    @tested_features = TestedFeature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tested_features }
    end
  end

  # GET /tested_features/1
  # GET /tested_features/1.xml
  def show
    @tested_feature = TestedFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tested_feature }
    end
  end

  # GET /tested_features/new
  # GET /tested_features/new.xml
  def new
    @tested_feature = TestedFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tested_feature }
    end
  end

  # GET /tested_features/1/edit
  def edit
    @tested_feature = TestedFeature.find(params[:id])
  end

  # POST /tested_features
  # POST /tested_features.xml
  def create
    @tested_feature = TestedFeature.new(params[:tested_feature])

    respond_to do |format|
      if @tested_feature.save
        format.html { redirect_to(@tested_feature, :notice => 'Tested feature was successfully created.') }
        format.xml  { render :xml => @tested_feature, :status => :created, :location => @tested_feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tested_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tested_features/1
  # PUT /tested_features/1.xml
  def update
    @tested_feature = TestedFeature.find(params[:id])

    respond_to do |format|
      if @tested_feature.update_attributes(params[:tested_feature])
        format.html { redirect_to(@tested_feature, :notice => 'Tested feature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tested_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tested_features/1
  # DELETE /tested_features/1.xml
  def destroy
    @tested_feature = TestedFeature.find(params[:id])
    @tested_feature.destroy

    respond_to do |format|
      format.html { redirect_to(tested_features_url) }
      format.xml  { head :ok }
    end
  end
end
