pdf.move_down(50)
pdf.text "Bienvenidos al aplicativo FLEXISTOCK de Macueros", :size => 13, :style => :bold

pdf.text "Articulo: #{@articulo.nombre}", :size => 15, :style => :bold
pdf.move_down(50)

tbl = [["NOMBRE DEL ARTICULO:      #{@articulo.nombre}"],
    ["REFERENCIA DEL ARTICULO:      #{@articulo.referencia}"],
    ["MARCA DEL ARTICULO:      #{@articulo.marca}"],
    ["PESO DEL ARTICULO:      #{@articulo.peso}"],
    ["TALLA DEL ARTICULO:      #{@articulo.talla}"],
    ["LOTE DEL ARTICULO:      #{@articulo.lote}"],
    ["UBICACION DEL ARTICULO:      #{@articulo.ubicacion}"],
    ["LINEA DEL PRODUCTO:      #{@articulo.lineas_producto.descripcion}"],
    ["COLOR DEL PRODUCTO:      #{@articulo.color}"],

  ["\n     _____________________            _____________________ \n             Entregado por                                Firma Recibido"]]

pdf.table tbl,
      :font_size          => 10,
      :border_width       => 0.7,
      :border_style       => :grid,
	  :position           => :center,
	  :page_size          => 'LETTER',
      :style              => :bold,
      :align              => { 0 => :left, 1 => :center},
      :column_widths      => { 0 => 300 }

pdf.move_down(20)
pdf.stroke_horizontal_rule
pdf.move_down(220)


pdf.text "MACUEROS   PARA ESTRELLAS COMO TU", :size => 13, :style => :bold
pdf.move_down(7)

pdf.text "Carrera 51 N° 45-39/ Local 106/ Teléfono: 511 80 87/ C.C Bolívar Amador.", :size => 10
pdf.move_down(7)

pdf.text "Carrera 49 N° 52-116/ Local 132/ Teléfono: 513 40 50/ C.C Boulevard de Junín. ", :size => 10
pdf.move_down(7)

pdf.text "contacto@macueros.com", :size => 10