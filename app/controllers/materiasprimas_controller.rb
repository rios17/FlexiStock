class MateriasprimasController < ApplicationController

  before_filter :find_articulo_and_materiasprima

  def index

   @materiasprimas = @articulo.materiasprimas.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @materiasprimas }
    end
  end

  def show
    @materiasprima = Materiasprima.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @materiasprima }
    end
  end

  # GET /materiasprimas/new
  # GET /materiasprimas/new.xml
  def new
    @materiasprima = Materiasprima.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @materiasprima }
    end
  end

  # GET /materiasprimas/1/edit
  def edit
    @materiasprima = Materiasprima.find(params[:id])
  end

  # POST /materiasprimas
  # POST /materiasprimas.xml
  def create
    @materiasprima = Materiasprima.new(params[:materiasprima])
    @materiasprima.articulo_id = @articulo.id
    respond_to do |format|
      if @materiasprima.save
        format.html { redirect_to articulo_materiasprimas_path(@articulo, :notice => 'Materiasprima was successfully created.') }
        format.xml  { render :xml => @materiasprima, :status => :created, :location => @materiasprima }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @materiasprima.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /materiasprimas/1
  # PUT /materiasprimas/1.xml
  def update
    @materiasprima = Materiasprima.find(params[:id])

    respond_to do |format|
      if @materiasprima.update_attributes(params[:materiasprima])
       format.html { redirect_to articulo_materiasprimas_path(@articulo, :notice => 'Materiasprima was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @materiasprima.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /materiasprimas/1
  # DELETE /materiasprimas/1.xml
  def destroy
    @materiasprima = Materiasprima.find(params[:id])
    @materiasprima.destroy

    respond_to do |format|
      format.html { redirect_to(articulo_materiasprimas_url) }
      format.xml  { head :ok }
    end
  end

  protected
def find_articulo_and_materiasprima
@articulo = Articulo.find(params[:articulo_id])
@materiasprima = Materiasprima.find(params[:id]) if params[:id]
end

end
