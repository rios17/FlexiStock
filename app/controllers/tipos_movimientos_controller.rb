class TiposMovimientosController < ApplicationController
  # GET /tipos_movimientos
  # GET /tipos_movimientos.xml
  def index
    @tipos_movimientos = TiposMovimiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_movimientos }
    end
  end

  # GET /tipos_movimientos/1
  # GET /tipos_movimientos/1.xml
  def show
    @tipos_movimiento = TiposMovimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipos_movimiento }
    end
  end

  # GET /tipos_movimientos/new
  # GET /tipos_movimientos/new.xml
  def new
    @tipos_movimiento = TiposMovimiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipos_movimiento }
    end
  end

  # GET /tipos_movimientos/1/edit
  def edit
    @tipos_movimiento = TiposMovimiento.find(params[:id])
  end

  # POST /tipos_movimientos
  # POST /tipos_movimientos.xml
  def create
    @tipos_movimiento = TiposMovimiento.new(params[:tipos_movimiento])

    respond_to do |format|
      if @tipos_movimiento.save
        format.html { redirect_to(@tipos_movimiento, :notice => 'TiposMovimiento was successfully created.') }
        format.xml  { render :xml => @tipos_movimiento, :status => :created, :location => @tipos_movimiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipos_movimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_movimientos/1
  # PUT /tipos_movimientos/1.xml
  def update
    @tipos_movimiento = TiposMovimiento.find(params[:id])

    respond_to do |format|
      if @tipos_movimiento.update_attributes(params[:tipos_movimiento])
        format.html { redirect_to(@tipos_movimiento, :notice => 'TiposMovimiento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipos_movimiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_movimientos/1
  # DELETE /tipos_movimientos/1.xml
  def destroy
    @tipos_movimiento = TiposMovimiento.find(params[:id])
    @tipos_movimiento.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_movimientos_url) }
      format.xml  { head :ok }
    end
  end
end
