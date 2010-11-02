pdf.move_down(50)
pdf.text "Bienvenidos al aplicativo FLEXISTOCK de Macueros", :size => 13, :style => :bold

pdf.text "CLIENTE: #{@cliente.nombre}", :size => 15, :style => :bold
pdf.move_down(50)

tbl = [["NIT DEL CLIENTE:      #{@cliente.nit}"],
    ["NOMBRE DEL CLIENTE:      #{@cliente.nombre}"],
    ["APELLIDO DEL CLIENTE:      #{@cliente.apellido}"],
    ["CEDULA DEL CLIENTE:      #{@cliente.cedula}"],
    ["EMAIL DEL CLIENTE:      #{@cliente.email}"],
    ["DIRECCION DEL CLIENTE:      #{@cliente.direccion}"],
    ["MUNICIPIO:      #{@cliente.municipio.name}"],
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