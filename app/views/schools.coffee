`import Ember from 'ember'`

schoolsView = Ember.View.extend

  templateName: 'schools'

  didInsertElement: ->
    $('#school-table').dataTable

      "ordering": false
      # "order": [[ 2, "desc" ]]
      # "info":     false

      stateSave: true

      "dom": '<"top"f>rt<"bottom"ip><"clear">'

      "columnDefs": [
        {
          "targets": [ 2 ],
          "visible": false,
          "searchable": false
        },
        {
          "targets": [ 3 ],
          "searchable": false
        }
      ]

      "language": {
        "lengthMenu": "Mostrar _MENU_ registros por página"
        "zeroRecords": "No hay resultados."
        "info": "Página _PAGE_ de _PAGES_"
        "infoEmpty": "No hay resultados."
        "infoFiltered": "(de un total de _MAX_ registros)"
        "search": "Buscar"
        "paginate": {
          "first":    "<<",
          "previous": "<",
          "next":     ">",
          "last":     ">>"
        }
      }

`export default schoolsView`