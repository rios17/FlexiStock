class ArticulosClientesController < ApplicationController

  before_filter :find_cliente_and_articulos_cliente

  def index
    #@articulos_clientes = ArticulosCliente.all
    @articulos_clientes = @cliente.articulos_clientes.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articulos_clientes }
    end
  end

  # GET /articulos_clientes/1
  # GET /articulos_clientes/1.xml
  def show
    @articulos_cliente = ArticulosCliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @articulos_cliente }
    end
  end

  # GET /articulos_clientes/new
  # GET /articulos_clientes/new.xml
  def new
    @articulos_cliente = ArticulosCliente.new
    @articulos = Articulo.all
    @sedes = Sede.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @articulos_cliente }
    end
  end

  # GET /articulos_clientes/1/edit
  def edit
    @articulos_cliente = ArticulosCliente.find(params[:id])
    @articulos = Articulo.all
    @sedes = Sede.all
  end

  # POST /articulos_clientes
  # POST /articulos_clientes.xml
  def create
    @articulos_cliente = ArticulosCliente.new(params[:articulos_cliente])
    @articulos_cliente.cliente_id = @cliente.id
    respond_to do |format|
      if @articulos_cliente.save
        format.html { redirect_to cliente_articulos_clientes_path(@cliente, :notice => 'ArticulosCliente was successfully created.') }
        format.xml  { render :xml => @articulos_cliente, :status => :created, :location => @articulos_cliente }
      else
        @sedes = Sede.all
        @articulos = Articulo.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @articulos_cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articulos_clientes/1
  # PUT /articulos_clientes/1.xml
  def update
    @articulos_cliente = ArticulosCliente.find(params[:id])

    respond_to do |format|
      if @articulos_cliente.update_attributes(params[:articulos_cliente])
        format.html { redirect_to(@articulos_cliente, :notice => 'ArticulosCliente was successfully updated.') }
        format.xml  { head :ok }
      else
        @sedes = Sede.all
        @articulos = Articulo.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @articulos_cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos_clientes/1
  # DELETE /articulos_clientes/1.xml
  def destroy
    @articulos_cliente = ArticulosCliente.find(params[:id])
    @articulos_cliente.destroy

    respond_to do |format|
      format.html { redirect_to(cliente_articulos_clientes_url) }
      format.xml  { head :ok }
    end
  end

  protected
def find_cliente_and_articulos_cliente
@cliente = Cliente.find(params[:cliente_id])
@articulos_cliente= ArticulosCliente.find(params[:id]) if params[:id]
end

end
