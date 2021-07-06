@extends('layouts.admin')

@section('title')
    Warehouse Dashboard
@endsection

@section('content')
    <div class="section-content section-dashboard-home" data-aos="fade-up">
      <div class="container-fluid">
        <div class="dashboard-heading">
          <h2 class="dashboard-title">Warehouse</h2>
          <p class="dashboard-subtitle">
            List of Products
          </p>
        </div>
        <div class="dashboard-content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-body">

                    <div class="text-left">

                    
                    <div class="text-right">
                        <a href="{{route('warehouseExport')}}" class="btn btn-success mb-3">Export</a>
                        <a href="{{route('print')}}"  class="btn btn-primary mb-3" target="_blank">Print</a>
                    </div>
                </div>     

                  <div class="table-responsive">
                    <table class="table table-hover scroll-horizontal-vertical w-100" id="crudTable">
                      <thead>
                        <tr>
                          <th>No.</th>
                          <th>Nama</th>
                          <th>Kategori</th>
                          <th>Harga</th>
                          <th>Quantity</th>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@endsection



@push('addon-script')
<script>
  $(document).ready(function()
  {
    fetch_data();
    function fetch_data(category=""){
        var datatable = $('#crudTable').DataTable({
            processing: true,
            serverSide: true,
            ordering: true,
            ajax: {
                url: '{!! url()->current() !!}',
               // type:"POST",
                query: function (d) {
                d.filter_category = $('#filter-category').val()
              }
            },
            
            columns: [
                { 
                  "data" :null, "sortable": false,
                  render : function (data, type, row, meta) 
                  {
                      return meta.row + meta.settings._iDisplayStart + 1
                  }

                },
                { data:'name', name:'name' },
                { data:'category.name', name:'category.name', orderable:false },
                { data:'price', name:'price' },
                { data: 'quantity', name: 'quantity',orderable:false, searchable: false}
            ]
        });
      }

      $("#filter-category").on('change', function()
      {
        var category_id = $("#filter-category").val();
        $("#crudTable").DataTable().destroy();

        fetch_data(category_id); 

      });
  });
    
   
</script>
@endpush


