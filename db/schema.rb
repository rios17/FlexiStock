# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081106072031) do

  create_table "articulos", :force => true do |t|
    t.string   "nombre",             :limit => 45, :null => false
    t.string   "referencia",         :limit => 30, :null => false
    t.string   "marca",              :limit => 45, :null => false
    t.string   "peso",               :limit => 45, :null => false
    t.string   "talla",              :limit => 45, :null => false
    t.string   "lote",               :limit => 45, :null => false
    t.string   "ubicacion",          :limit => 45, :null => false
    t.integer  "lineas_producto_id",               :null => false
    t.integer  "color_id",                         :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "articulos", ["color_id"], :name => "fk_articulos_colores1"
  add_index "articulos", ["lineas_producto_id"], :name => "fk_articulos_lineas_productos1"

  create_table "articulos_clientes", :force => true do |t|
    t.integer "articulo_id",     :null => false
    t.integer "cliente_id",      :null => false
    t.integer "total_articulos", :null => false
  end

  add_index "articulos_clientes", ["articulo_id"], :name => "fk_articulos_cliente_articulos1"
  add_index "articulos_clientes", ["cliente_id"], :name => "fk_articulos_cliente_clientes1"

  create_table "clientes", :force => true do |t|
    t.string   "nit",               :limit => 30, :null => false
    t.string   "nombre",                          :null => false
    t.string   "apellido",                        :null => false
    t.string   "cedula",                          :null => false
    t.string   "email",                           :null => false
    t.string   "direccion",                       :null => false
    t.integer  "municipio_id",                    :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "clientes", ["municipio_id"], :name => "fk_clientes_municipios1"

  create_table "colores", :force => true do |t|
    t.string "tipo_color", :limit => 20, :null => false
  end

  create_table "contactos", :force => true do |t|
    t.string  "descripcion",   :limit => 30, :null => false
    t.string  "tipo_contacto", :limit => 20, :null => false
    t.integer "cliente_id",                  :null => false
  end

  add_index "contactos", ["cliente_id"], :name => "fk_contactos_clientes1"

  create_table "departamentos", :force => true do |t|
    t.string  "name",    :limit => 20, :null => false
    t.integer "pais_id",               :null => false
  end

  add_index "departamentos", ["pais_id"], :name => "fk_departamentos_paises1"

  create_table "despachos", :force => true do |t|
    t.string  "cantidad",           :limit => 30, :null => false
    t.string  "cliente_que_recibe", :limit => 20, :null => false
    t.string  "fecha_despacho",     :limit => 45, :null => false
    t.integer "cliente_id",                       :null => false
  end

  add_index "despachos", ["cliente_id"], :name => "fk_despachos_clientes1"

  create_table "existencias", :force => true do |t|
    t.integer "cantidad_disponible", :null => false
    t.integer "articulo_id",         :null => false
  end

  add_index "existencias", ["articulo_id"], :name => "fk_existencias_articulos1"

  create_table "lineas_productos", :force => true do |t|
    t.string "descripcion", :limit => 30, :null => false
  end

  create_table "materias_primas", :force => true do |t|
    t.string  "tipo_material", :limit => 45, :null => false
    t.integer "articulo_id",                 :null => false
  end

  add_index "materias_primas", ["articulo_id"], :name => "fk_materia_prima_articulos1"

  create_table "movimientos_inventarios", :force => true do |t|
    t.integer "cantidad",           :null => false
    t.date    "fecha",              :null => false
    t.integer "tipo_movimiento_id", :null => false
    t.integer "articulo_id",        :null => false
  end

  add_index "movimientos_inventarios", ["articulo_id"], :name => "fk_movimientos_inventarios_articulos1"
  add_index "movimientos_inventarios", ["tipo_movimiento_id"], :name => "fk_movimientos_inventarios_tipos_movimientos1"

  create_table "municipios", :force => true do |t|
    t.string  "name",            :limit => 45, :null => false
    t.integer "departamento_id",               :null => false
  end

  add_index "municipios", ["departamento_id"], :name => "fk_municipios_departamentos"

  create_table "paises", :force => true do |t|
    t.string "name",                :null => false
    t.string "silga", :limit => 45, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tipos_movimientos", :force => true do |t|
    t.string "descripcion", :limit => 45, :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
