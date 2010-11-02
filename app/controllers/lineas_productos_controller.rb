class LineasProductosController < ApplicationController
  # GET /lineas_productos
  # GET /lineas_productos.xml
  def index
    @lineas_productos = LineasProducto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lineas_productos }
    end
  end

  # GET /lineas_productos/1
  # GET /lineas_productos/1.xml
  def show
    @lineas_producto = LineasProducto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lineas_producto }
    end
  end

  # GET /lineas_productos/new
  # GET /lineas_productos/new.xml
  def new
    @lineas_producto = LineasProducto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineas_producto }
    end
  end

  # GET /lineas_productos/1/edit
  def edit
    @lineas_producto = LineasProducto.find(params[:id])
  end

  # POST /lineas_productos
  # POST /lineas_productos.xml
  def create
    @lineas_producto = LineasProducto.new(params[:lineas_producto])

    respond_to do |format|
      if @lineas_producto.save
        format.html { redirect_to(@lineas_producto, :notice => 'LineasProducto was successfully created.') }
        format.xml  { render :xml => @lineas_producto, :status => :created, :location => @lineas_producto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lineas_producto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lineas_productos/1
  # PUT /lineas_productos/1.xml
  def update
    @lineas_producto = LineasProducto.find(params[:id])

    respond_to do |format|
      if @lineas_producto.update_attributes(params[:lineas_producto])
        format.html { redirect_to(@lineas_producto, :notice => 'LineasProducto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lineas_producto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas_productos/1
  # DELETE /lineas_productos/1.xml
  def destroy
    @lineas_producto = LineasProducto.find(params[:id])
    @lineas_producto.destroy

    respond_to do |format|
      format.html { redirect_to(lineas_productos_url) }
      format.xml  { head :ok }
    end
  end
end
