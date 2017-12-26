//= require bootstrap.js
//= require css3clock.js
//= require plugins/chart/Chart.bundle.js
//= require plugins/chart/utils.js
//= require global.js
//= require bootstrap3-typeahead.js

//= require plugins/moment/moment.min
//= require plugins/moment/moment-timezone-with-data-2010-2020.min.js
//= require plugins/datatable/jquery.dataTables.min
//= require plugins/datatable/dataTables.bootstrap.min
//= require plugins/datatable/dataTables.responsive.min
//= require plugins/datatable/dataTables.buttons.min.js
//= require plugins/datatable/buttons.flash.min.js
//= require plugins/datatable/buttons.html5.min.js
//= require plugins/datatable/buttons.print.min.js
//= require plugins/datatable/dataTables.fixedHeader.min.js
//= require plugins/datatable/jszip.min.js
//= require plugins/datatable/pdfmake.min.js
//= require plugins/datatable/vfs_fonts.js
//= require plugins/select2/select2.full.min.js
//= require data-confirm-modal


$(function(){
    $('.select2').select2();
 	$('.typeahead_3').typeahead({
	    source: ["Criar um usuário",
	             "Listar usuários",
	             "Fazer um pagamento",
	             "Adicionar uma agência",
	             "Adicionar uma conta"
	             ],
                         
    });



   $('.hh input.typeahead_3').on('change',function(evt,data){
    console.log(data);
    if (!data) {
        window.location = '/search?q=' + encodeURIComponent($('.typeahead_3').val());
        }
    return false;
    }); 





$('#table_inter').DataTable({
        "oLanguage": {
            "sEmptyTable": "Nenhum registro encontrado",
            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
            "sInfoFiltered": "(Filtrados de _MAX_ registros)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "Mostrando _MENU_ resultados",
            "sLoadingRecords": "Carregando...",
            "sProcessing": "Processando...",
            "sZeroRecords": "Nenhum registro encontrado",
            "sSearch": "Pesquisar",
            "oPaginate": {
                "sNext": "Próximo",
                "sPrevious": "Anterior",
                "sFirst": "Primeiro",
                "sLast": "Último"
            },
            "oAria": {
                "sSortAscending": ": Ordenar colunas de forma ascendente",
                "sSortDescending": ": Ordenar colunas de forma descendente"
            }
        },
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "responsive": true,
        "pageLength": 50,
        dom: "Bfrtip",
              buttons: [
                {
                    extend: 'csv',
                    title: 'InterBank - CSV - '+ moment().format('DD/MM/YYYY HH:mm:ss') + ' - '+$('.box-title').html(),
                    exportOptions: {
                        columns: "thead th:not(.noExport)"
                    }
                },
                {  
                     extend: 'excel',
                    title: 'InterBank - EXCEL - '+ moment().format('DD/MM/YYYY HH:mm:ss') + ' - '+$('.box-title').html(),
                    exportOptions: {
                        columns: "thead th:not(.noExport)"
                    }
                },

                {
                    extend: 'pdf',
                    title: 'InterBank - PDF - '+ moment().format('DD/MM/YYYY HH:mm:ss') + ' - '+$('.box-title').html(),
                    exportOptions: {
                        columns: "thead th:not(.noExport)"
                    }
                }
              ]
    }); 



    dataConfirmModal.setDefaults({
        title: '',
        commit: 'Continuar',
        cancel: 'Cancelar',
        onConfirm: function() { return true },
        onCancel:  function() { return false },
        modalClass: 'patrick-modal'
    });




})