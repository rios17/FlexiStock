include ChainSelectsHelper

class ClientesController < ApplicationController


  layout :determine_layout

  def index
  @clientes = Cliente.search(params[:search], params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clientes }
      format.js
    end
  end



  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cliente }
      format.pdf { render :layout => false }
    end
  end


  def new
    @cliente = Cliente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cliente }
    end
  end


  def edit
    @cliente = Cliente.find(params[:id])
  end


  def create
    @cliente = Cliente.new(params[:cliente])
    @cliente.municipio_id = params[:chain_select][:municipio]
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to(@cliente, :notice => 'Cliente creado satisfactoriamente') }
        format.xml  { render :xml => @cliente, :status => :created, :location => @cliente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        format.html { redirect_to(@cliente, :notice => 'Cliente Actualizado satisfactoriamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to(clientes_url) }
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
