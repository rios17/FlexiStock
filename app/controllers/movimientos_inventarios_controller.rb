class MovimientosInventariosController < ApplicationController
  # GET /movimientos_inventarios
  # GET /movimientos_inventarios.xml
  def index
    @movimientos_inventarios = MovimientosInventario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movimientos_inventarios }
    end
  end

  # GET /movimientos_inventarios/1
  # GET /movimientos_inventarios/1.xml
  def show
    @movimientos_inventario = MovimientosInventario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimientos_inventario }
    end
  end

  # GET /movimientos_inventarios/new
  # GET /movimientos_inventarios/new.xml
  def new
    @movimientos_inventario = MovimientosInventario.new
    @tipos_movimientos = TiposMovimiento.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimientos_inventario }
    end
  end

  # GET /movimientos_inventarios/1/edit
  def edit
    @movimientos_inventario = MovimientosInventario.find(params[:id])
    @tipos_movimientos = TiposMovimiento.all
  end

  # POST /movimientos_inventarios
  # POST /movimientos_inventarios.xml
  def create
    @movimientos_inventario = MovimientosInventario.new(params[:movimientos_inventario])

    respond_to do |format|
      if @movimientos_inventario.save
        format.html { redirect_to(@movimientos_inventario, :notice => 'MovimientosInventario was successfully created.') }
        format.xml  { render :xml => @movimientos_inventario, :status => :created, :location => @movimientos_inventario }
      else
        @tipos_movimientos = TiposMovimiento.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimientos_inventario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movimientos_inventarios/1
  # PUT /movimientos_inventarios/1.xml
  def update
    @movimientos_inventario = MovimientosInventario.find(params[:id])

    respond_to do |format|
      if @movimientos_inventario.update_attributes(params[:movimientos_inventario])
        format.html { redirect_to(@movimientos_inventario, :notice => 'MovimientosInventario was successfully updated.') }
        format.xml  { head :ok }
      else
        @tipos_movimientos = TiposMovimiento.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movimientos_inventario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos_inventarios/1
  # DELETE /movimientos_inventarios/1.xml
  def destroy
    @movimientos_inventario = MovimientosInventario.find(params[:id])
    @movimientos_inventario.destroy

    respond_to do |format|
      format.html { redirect_to(movimientos_inventarios_url) }
      format.xml  { head :ok }
    end
  end
end
