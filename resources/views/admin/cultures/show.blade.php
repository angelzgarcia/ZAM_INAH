
@extends('layouts.main-admin')

@section('titulo')
    Cultura {{$culture->nombre}} | INAH | Admin
@endsection

@section('admin-content')

    <h2><a href="{{route('admin.cultures.index')}}">Volver a las culturas</a></h2>
    <h2><a href="{{route('admin.cultures.edit', $culture)}}">Editar</a></h2>
    <form action="{{route("admin.cultures.destroy", $culture)}}" method="POST">
        @csrf
        @method('delete')
        <button type="submit">Eliminar</button>
    </form>
    {{-- {{phpinfo()}} --}}
    <h1>HAZ BUSCADO LA CULTURA <em><big>{{$culture->idCultura}} | "{{$culture->nombre}}"</big></em></h1>
    <p>{{$culture->descripcion}}</p>
    @foreach ($culture->fotos as $foto)
        <br>
        <img src="{{ img_u_url($foto->foto)}}" width="300px" alt="cultura">
    @endforeach

@endsection
