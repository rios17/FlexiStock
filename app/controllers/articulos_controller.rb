class ArticulosController < ApplicationController

   before_filter :find_cliente_and_articulo
   before_filter :require_user
  layout :determine_layout


  def index
    @articulos = Articulo.search(params[:search], params[:page])
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articulos }
    end
  end

  def estadisticas

    @cantidades = Existenciasede.find_all_by_articulo_id(params[:id])
    @existencias = Existenciasede.exis_x_sede(@cantidades)
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articulos }
    end
  end

  def show
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @articulo }
      format.pdf { render :layout => false }
    end
  end


  def new
    @articulo = Articulo.new
    @lineas_productos = LineasProducto.all
    @colores = Color.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @articulo }
    end
  end


  def edit
    @lineas_productos = LineasProducto.all
    @colores = Color.all
  end


  def create
    @articulo = Articulo.new(params[:articulo])
     @lineas_productos = LineasProducto.all
    respond_to do |format|
      if @articulo.save
        format.html { redirect_to(@articulo, :notice => 'Articulo creado satisfactoriamente') }
        format.xml  { render :xml => @articulo, :status => :created, :location => @articulo }
      else
        @colores = Color.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @articulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @lineas_productos = LineasProducto.all
    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        format.html { redirect_to(@articulo, :notice => 'Articulo actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        @colores = Color.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @articulo.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to(articulos_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_cliente_and_articulo
      @articulo = Articulo.find(params[:id]) if params[:id]
  end
private
  def determine_layout
     if ['create','index', 'new', 'edit'].include?(action_name)
        "application"
     else
        "basico"
     end
  end

end
