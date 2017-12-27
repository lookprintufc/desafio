press = (key) ->
  if key == 1
    window.location.href = '/agency_banks'
  else if key == 12
    window.location.href = '/account_banks'
  else if key == 19
    window.location.href = '/money_transfer'
  else if key == 6
    window.location.href = '/withdrawal'
  else if key == 24
    window.location.href = '/deposit'
  return

$ ->
  $('.select2').select2()
  $('.typeahead_3').typeahead source: [
    'Criar um usuário'
    'Listar usuários'
    'Fazer um pagamento'
    'Adicionar uma agência'
    'Adicionar uma conta'
  ]
  $('.hh input.typeahead_3').on 'change', (evt, data) ->
    console.log data
    if !data
      window.location = '/search?q=' + encodeURIComponent($('.typeahead_3').val())
    false
  $('#table_inter').DataTable
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
    'paging': true
    'lengthChange': true
    'searching': true
    'ordering': true
    'info': true
    'autoWidth': true
    'responsive': true
    'pageLength': 50
    dom: 'Bfrtip'
    buttons: [
      {
        extend: 'csv'
        title: 'InterBank - CSV - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
      {
        extend: 'excel'
        title: 'InterBank - EXCEL - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
      {
        extend: 'pdf'
        title: 'InterBank - PDF - ' + moment().format('DD/MM/YYYY HH:mm:ss') + ' - ' + $('.box-title').html()
        exportOptions: columns: 'thead th:not(.noExport)'
      }
    ]
  dataConfirmModal.setDefaults
    title: ''
    commit: 'Continuar'
    cancel: 'Cancelar'
    onConfirm: ->
      true
    onCancel: ->
      false
    modalClass: 'patrick-modal'
  $('#account').change ->
    inputString = $('#account').val()
    $.post '/account/suggestion', { number_account: '' + inputString + '' }, (data) ->
      if data.length > 0
        $('#receber_infos').html data
      return
    return
  $('#account_d').change ->
    inputString = $('#account_d').val()
    $.post '/account/suggestion', { number_account: '' + inputString + '' }, (data) ->
      if data.length > 0
        $('#receber_infos_d').html data
      return
    return
  return
