class ExistenciasedesController < ApplicationController
  before_filter :find_articulo_and_existenciasede
  layout :determine_layout
  def index
    @existenciasedes = @articulo.existenciasedes.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @existenciasedes }
    end
  end


  def show
    @existenciasede = Existenciasede.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @existenciasede }
    end
  end


  def new
    @existenciasede = Existenciasede.new
    @sedes = Sede.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @existenciasede }
    end
  end

  # GET /existenciasedes/1/edit
  def edit
    @existenciasede = Existenciasede.find(params[:id])
    @sedes = Sede.all
  end


  def create
    @existenciasede = Existenciasede.new(params[:existenciasede])
     @existenciasede.articulo_id = @articulo.id

    respond_to do |format|
      if @existenciasede.save
        flash[:notice] = 'Existencia creada satisfactoriamente.'
         format.html { redirect_to articulo_existenciasede_path(@articulo,@existenciasede )}
        format.xml  { render :xml => @existenciasede, :status => :created, :location => @existenciasede }
      else
          @sedes = Sede.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @existenciasede.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @existenciasede = Existenciasede.find(params[:id])
    @existenciasede.articulo_id = @articulo.id
    respond_to do |format|
      if @existenciasede.update_attributes(params[:existenciasede])
        flash[:notice] = 'Existencia Actualizada satisfactoriamente'
         format.html { redirect_to articulo_existenciasede_path(@articulo)}
        format.xml  { head :ok }
      else
          @sedes = Sede.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @existenciasede.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @existenciasede.destroy
    respond_to do |format|
     format.html { redirect_to(articulo_existenciasedes_url) }
      format.xml  { head :ok }
    end
  end

   protected
  def find_articulo_and_existenciasede
      @articulo = Articulo.find(params[:articulo_id])
      @existenciasede = Existenciasede.find(params[:id]) if params[:id]
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
