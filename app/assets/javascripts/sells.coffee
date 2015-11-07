# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', -> #Cuando cambie de pagina el va a cargar todo lo que se le asigne, document es toda la pagina

    traer_cantidad_valor = (id) -> #Traer la cantidad y el valor del producto
        $.ajax #llamada al ajax
            url: "/sells/traer_producto" #url siginifica el controlador de sell y llama a un evento guardado en ese controlador llamado traer_producto
            dataType: 'json' # lo que yo le voy a recivir es un .json
            type: 'post' #por medio del metodo post vamos a traer esos datos
            data: product_id: id #Creamos una variable que va hacer el id de product
            success: (data) -> # si tiene exito me traer en respuesta y lo guardo en data
                $('#cantidad').text(data.cantidad) # lo que este dentro de las etiquetas con id cantidad le vamos a traer la cantidad del producto
                $('#valor').text(data.precio) # lo que este dentro de las etiquetas con id cantidad le vamos a traer la cantidad del producto
                
    $('#sell_product_id').change -> #Cuando cambie la opcion en el select se ejecuta este evento
        if @value # disvalue es el valor que esta seleccionado, value es el varlor que esta seleccionado en el select
            traer_cantidad_valor(@value)
        else
            $('.clean').text(0) # hace un llamado a la clase y lo convierte en cero
            
    