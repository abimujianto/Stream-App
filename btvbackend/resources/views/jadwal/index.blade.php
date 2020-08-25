@extends('layout.master')
@section('content')
<div class="main">
  <div class="main-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        <div class="panel">
								<div class="panel-heading">
                  <h3 class="panel-title">Jadwal Siaran</h3>
                  <div class="right">
                <button type="button" class="btn" data-toggle="modal" data-target="#exampleModal"><i class="lnr lnr-plus-circle"></i></button>
                    </div>
               		</div>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
                        <th>HARI</th>
                        <th>JADWAL</th>
											</tr>
										</thead>
										<tbody>
										@foreach($data_jadwal as $jadwal)
                      <tr>
                          <td>{{$jadwal-> hari}}</td>
                          <td>{{$jadwal-> program_detail}}</td>
                      
                          <td><a href="/jadwal/{{$jadwal->id}}/edit" class="btn btn-warning btn-sm">Edit</a>
                              <a href="/jadwal/{{$jadwal->id}}/delete" class="btn btn-danger btn-sm" onclick="return confirm('Yakin mau dihapus ?')">Delete</a>
                          </td>                      
                        </tr>
                      @endforeach
										</tbody>
									</table>
								</div>
							</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tambah Jadwal Siaran</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
              <form action="/jadwal/create" method="POST">
              {{csrf_field()}}
              <div class="form-group">
                <label for="exampleInputEmail1">Hari</label>
                <input name="hari" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Hari Siaran">
                </div>
             
             
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Program Detail</label>
                <textarea name="program_detail" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
             
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
            </form>
      </div>
    </div>
  </div>
@stop



