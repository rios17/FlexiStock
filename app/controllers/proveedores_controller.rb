class ProveedoresController < ApplicationController
layout :determine_layout
  def index
     @proveedores = Proveedor.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proveedores }
    end
  end


  def show
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proveedor }
    end
  end


  def new
    @proveedor = Proveedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proveedor }
    end
  end


  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  def create
    @proveedor = Proveedor.new(params[:proveedor])

    respond_to do |format|
      if @proveedor.save
        flash[:notice] = 'Proveedor creado satisfactoriamente.'
        format.html { redirect_to(@proveedor) }
        format.xml  { render :xml => @proveedor, :status => :created, :location => @proveedor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proveedor.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      if @proveedor.update_attributes(params[:proveedor])
        flash[:notice] = 'Proveedor Actualizado satisfactoriamente.'
        format.html { redirect_to(@proveedor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proveedor.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @proveedor = Proveedor.find(params[:id])
    @proveedor.destroy

    respond_to do |format|
      format.html { redirect_to(proveedores_url) }
      format.xml  { head :ok }
    end
  end

  private
  def determine_layout
     if ['create','index'].include?(action_name)
        "application"
     else
        "basico"
     end
  end

end
