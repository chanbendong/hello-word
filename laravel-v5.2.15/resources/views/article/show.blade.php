@extends('public.basic')
@section('menu')
    <ul class="nav nav-sidebar">
        <li class="active"><a href="#">文章管理</a></li>
        <li><a href="/article/create">发表文章</a></li>
        <li><a href="#">Analytics</a></li>
        <li><a href="#">Export</a></li>
    </ul>
@stop
@section('content')
    <h2>{{$article->title}}</h2>
    <hr>
    {!! $article->content !!}
@endsection
