class DespachosController < ApplicationController


  before_filter :find_articulos_cliente_and_despacho

  def index
    #@despachos = Despacho.all
    @despachos = @articulos_cliente.despachos.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @despachos }
    end
  end


  def show
    @despacho = Despacho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @despacho }
    end
  end

  def new
    @despacho = Despacho.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @despacho }
    end
  end


  def edit
    @despacho = Despacho.find(params[:id])
  end

  def create
    @despacho = Despacho.new(params[:despacho])
    @despacho.cliente_id = @cliente.id
    @despacho.articulos_cliente_id = @articulos_cliente.id
    respond_to do |format|
      if @despacho.save

        format.html { redirect_to articulos_cliente_despachos_path(@articulos_cliente, :notice => 'Despacho creado satisfactoriamente.') }
        format.xml  { render :xml => @despacho, :status => :created, :location => @despacho }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @despacho.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @despacho = Despacho.find(params[:id])
    @despacho.cliente_id = @cliente.id
    respond_to do |format|
      if @despacho.update_attributes(params[:despacho])
        format.html { redirect_to articulos_cliente_despachos_path(@articulos_cliente, :notice => 'Despacho actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @despacho.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @despacho = Despacho.find(params[:id])
    @despacho.destroy

    respond_to do |format|
      format.html { redirect_to(articulos_cliente_despachos_url) }
      format.xml  { head :ok }
    end
  end

  protected
def find_articulos_cliente_and_despacho
@articulos_cliente = ArticulosCliente.find(params[:articulos_cliente_id])
@despacho = Despacho.find(params[:id]) if params[:id]
end

end
