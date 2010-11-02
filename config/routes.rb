ActionController::Routing::Routes.draw do |map|
  map.resources :materiasprimas

  map.resources :proveedores, :has_many => :compras

  map.resources :sedes


  #map.resources :articulos_clientes
  map.root :controller => "articulos", :action => "index"

  map.chain_selects

  #map.resources :despachos

  map.resources :contactos

  map.resources :clientes, :has_many => :articulos_clientes

  map.resources :clientes do |cliente|
  cliente.resources :contactos
  end

  map.resources :municipios

  map.resources :departamentos

  map.resources :paises

  map.resources :tipos_movimientos

  map.resources :movimientos_inventarios

  #map.resources :caracteristicas

  map.resources :colores

  map.resources :lineas_productos

  map.resources :articulos, :collection => { :estadisticas => :get}

  map.resources :articulos do |articulo|
      articulo.resources :existenciasedes
      articulo.resources :caracteristicas
      articulo.resources :materiasprimas
  end

  map.resources :articulos_clientes do |articulos_cliente|
  articulos_cliente.resources :despachos
  end

  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session

  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
