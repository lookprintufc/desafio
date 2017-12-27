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
//= require transaction.coffee
//= require init_and_extras.coffee


function press(key) {
  if (key === 1) {
    window.location.href = '/agency_banks';
  } else if (key === 12) {
    window.location.href = '/account_banks';
  } else if (key === 19) {
    window.location.href = '/money_transfer';
  } else if (key === 6) {
    window.location.href = '/withdrawal';
  } else if (key === 24) {
    window.location.href = '/deposit';
  }
};

