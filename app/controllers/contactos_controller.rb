class ContactosController < ApplicationController

  before_filter :find_cliente_and_contacto

  def index
   # @contactos = Contacto.all
    @contactos = @cliente.contactos.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contactos }
    end
  end

  # GET /contactos/1
  # GET /contactos/1.xml
  def show
    @contacto = Contacto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contacto }
    end
  end

  # GET /contactos/new
  # GET /contactos/new.xml
  def new
    @contacto = Contacto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contacto }
    end
  end

  # GET /contactos/1/edit
  def edit
    @contacto = Contacto.find(params[:id])
  end

  # POST /contactos
  # POST /contactos.xml
  def create
    @contacto = Contacto.new(params[:contacto])
    @contacto.cliente_id = @cliente.id
    respond_to do |format|
      if @contacto.save
        format.html { redirect_to cliente_contactos_path(@cliente, :notice => 'Contacto Creado Satisfactoriamente.') }
        format.xml  { render :xml => @contacto, :status => :created, :location => @contacto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contacto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contactos/1
  # PUT /contactos/1.xml
  def update
    @contacto = Contacto.find(params[:id])

    respond_to do |format|
      if @contacto.update_attributes(params[:contacto])
        format.html { redirect_to cliente_contactos_path(@cliente, :notice => 'Información Actualizada Correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contacto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.xml
  def destroy
    @contacto = Contacto.find(params[:id])
    @contacto.destroy

    respond_to do |format|
      format.html { redirect_to(contactos_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_cliente_and_contacto
  @cliente = Cliente.find(params[:cliente_id])
  @contacto = Contacto.find(params[:id]) if params[:id]
end

end
