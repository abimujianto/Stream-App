@extends('layout.master')


@section('content')
<div class="main">
  <div class="main-content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
        <div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Inputs</h3>
								</div>
								<div class="panel-body">
								
                <form action="/jadwal/{{$jadwal->id}}/update" method="POST">
              {{csrf_field()}}
              <div class="form-group">
                <label for="exampleInputEmail1">Hari</label>
                <input name="hari" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Hari" value="{{$jadwal->hari}}">
                </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Detail Program</label>
                <textarea name="program_detail" class="form-control" id="exampleFormControlTextarea1" rows="3">{{$jadwal->program_detail}}</textarea>
              </div>
     
            
        <button type="submit" class="btn btn-warning">Update</button>
        </form>
							</div>
        </div>
      </div>
    </div>
  </div>
</div>

@stop
