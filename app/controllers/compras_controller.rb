class ComprasController < ApplicationController

  before_filter :find_proveedor_and_compra
  layout :determine_layout

  def index
   @compras = @proveedor.compras.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @compras }
    end
  end



  def show
    @compra = Compra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @compra }
    end
  end


  def new
    @compra = Compra.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @compra }
    end
  end


  def edit
    @compra = Compra.find(params[:id])
  end

  def create
    @compra = Compra.new(params[:compra])
    @compra.proveedor_id = @proveedor.id
    respond_to do |format|
      if @compra.save
        flash[:notice] = 'Compra creada satisfactoriamente'
        format.html { redirect_to proveedor_compra_path(@proveedor,@compra )}
        format.xml  { render :xml => @compra, :status => :created, :location => @compra }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @compra.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @compra = Compra.find(params[:id])
    @compra.proveedor_id = @proveedor.id
    respond_to do |format|
      if @compra.update_attributes(params[:compra])
        flash[:notice] = 'Compra Actualizada Satisfactoriamente.'
        format.html { redirect_to proveedor_compra_path(@proveedor)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @compra.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @compra = Compra.find(params[:id])
    @compra.destroy

    respond_to do |format|
       format.html { redirect_to(proveedor_compras_url) }
      format.xml  { head :ok }
    end
  end

    protected
  def find_proveedor_and_compra
      @proveedor = Proveedor.find(params[:proveedor_id])
      @compra = Compra.find(params[:id]) if params[:id]
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
