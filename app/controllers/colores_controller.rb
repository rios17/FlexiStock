class ColoresController < ApplicationController
  # GET /colores
  # GET /colores.xml
  def index
    @colores = Color.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @colores }
    end
  end

  # GET /colores/1
  # GET /colores/1.xml
  def show
    @color = Color.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @color }
    end
  end

  # GET /colores/new
  # GET /colores/new.xml
  def new
    @color = Color.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @color }
    end
  end

  # GET /colores/1/edit
  def edit
    @color = Color.find(params[:id])
  end

  # POST /colores
  # POST /colores.xml
  def create
    @color = Color.new(params[:color])

    respond_to do |format|
      if @color.save
        format.html { redirect_to(@color, :notice => 'Color was successfully created.') }
        format.xml  { render :xml => @color, :status => :created, :location => @color }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /colores/1
  # PUT /colores/1.xml
  def update
    @color = Color.find(params[:id])

    respond_to do |format|
      if @color.update_attributes(params[:color])
        format.html { redirect_to(@color, :notice => 'Color was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @color.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /colores/1
  # DELETE /colores/1.xml
  def destroy
    @color = Color.find(params[:id])
    @color.destroy

    respond_to do |format|
      format.html { redirect_to(colores_url) }
      format.xml  { head :ok }
    end
  end
end
