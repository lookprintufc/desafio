$ ->
  $('#transaction-table').dataTable
    
    processing: true
    serverSide: true
    pageLength: 50
    ajax: $('#transaction-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'created_at'}
      {data: 'transaction_type'}
      {data: 'price'}
      {data: 'user'}
      {data: 'cash_back'}
    ]
    'oLanguage':
      'sEmptyTable': 'Nenhum registro encontrado'
      'sInfo': 'Mostrando de _START_ até _END_ de _TOTAL_ registros'
      'sInfoEmpty': 'Mostrando 0 até 0 de 0 registros'
      'sInfoFiltered': '(Filtrados de _MAX_ registros)'
      'sInfoPostFix': ''
      'sInfoThousands': '.'
      'sLengthMenu': 'Mostrando _MENU_ resultados'
      'sLoadingRecords': 'Carregando...'
      'sProcessing': 'Processando...'
      'sZeroRecords': 'Nenhum registro encontrado'
      'sSearch': 'Pesquisar'
      'oPaginate':
        'sNext': 'Próximo'
        'sPrevious': 'Anterior'
        'sFirst': 'Primeiro'
        'sLast': 'Último'
      'oAria':
        'sSortAscending': ': Ordenar colunas de forma ascendente'
        'sSortDescending': ': Ordenar colunas de forma descendente'
    dom: 'Blrtip'
    buttons: [
      {
        extend: 'csv'
        title: 'Interbank 2018 - CSV - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
      {
        extend: 'excel'
        title: 'Interbank - EXCEL - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
      {
        extend: 'pdf'
        title: 'Interbank - PDF - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
    ]