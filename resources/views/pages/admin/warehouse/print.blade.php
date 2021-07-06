<!DOCTYPE html>
<html>
<head>
  <title>Print Stock Report</title>
  <meta name="csrf-token" content={{csrf_token()}}>
</head>

<body>
  <div class="form-group">
    <h3 align="center"><b>WAREHOUSE REPORT</b></h3>
    <br>
    <br>
      <table class="static" align="center" rules="all" border="1px" style="width:95%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Kategori</th>
            <th>Harga</th>
            <th>Quantity</th>
          </tr>
        </thead>
       @foreach($products as $data)
            <tr>
                <td>{{$data->id}}</td>
                <td>{{$data->name}}</td>
               <td>{{$data->category["name"]}}</td>  
                <td>{{$data->price}}</td>
                <td>{{$data->quantity}}</td>
            </tr>
             @endforeach
      </table>
  </div>

  <script type="text/javascript">
    window.print();
  </script>


</body>
</html>

