  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
  <style type="text/css">
    #dt.dataTable.no-footer {
      border-bottom: unset;
    }

    #dt tbody td {
      display: block;
      border: unset;
    }

    #dt>tbody>tr>td {
      border-top: unset;
    }
  </style>

  <div class="container py-4">
    <div class="row">
      <div class="col-12">
        <table id="dt" class="table w-100">
          <thead>
            <tr>
              <th>photo</th>
              <th>nama</th>
              <th>harga</th>
         
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div> <!-- end container -->

  <script type="text/javascript">
    $(document).ready(function() {
      $("#dt thead").hide();
      var dt = $('#dt').DataTable({
        ajax: "http://localhost:8000/api/table/product",
        bInfo: false,
        pageLength: 8,
        lengthChange: false,
        deferRender: true,
        processing: true,
        language: {
          paginate: {
            previous: "<",
            next: ">"
          },
        },
        columns: [{
            render: function(data, type, row, meta) {
              var html =
                '<div class="card shadow">' +
                '  <img src="' + row.photo + '" class="card-img-top">' +
                '  <div class="card-body">' +
                '    <div class="card-text">Nama : ' + row.name + '</div>' +
                '    <div class="card-text">Price : ' + row.price + '</div>' +
                '  </div>' +
                '</div>';
              return html;
            }
          },
          {
            data: "name",
            visible: false
          }
        ]
      });

      dt.on('draw', function(data) {
        $('#dt tbody').addClass('row');
        $('#dt tbody tr').addClass('col-lg-3 col-md-4 col-sm-12');
      });
    });
  </script>
