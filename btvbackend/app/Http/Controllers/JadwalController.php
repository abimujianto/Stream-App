<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class JadwalController extends Controller
{
    public function index()
    {
        $data_jadwal = \App\jadwal::all();
        return view('jadwal.index', ['data_jadwal'=>$data_jadwal]);
    }
    public function create(Request $request)
    {
        \App\jadwal::create($request->all());
        return redirect ('/jadwal')->with('sukses', 'Berhasil Menambah Data');
    }
    public function edit($id)
    {
        $jadwal = \App\jadwal::find($id);
        return view('jadwal/edit', ['jadwal' => $jadwal]);
    }
    public function update(Request $request, $id)
    {
        $jadwal = \App\jadwal::find($id);
        $jadwal->update($request->all());
        return redirect('/jadwal')->with('sukses', 'Data Berhasil Dirubah');
    }
    public function delete($id)
    {
        $jadwal = \App\jadwal::find($id);
        $jadwal->delete();
        return redirect('/jadwal')->with('sukses', 'Data Berhasil Dihapus');
    }
}
