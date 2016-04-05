@extends('public.basic')
@section('menu')
    <ul class="nav nav-sidebar">
        <li><a href="/article">文章管理</a></li>
        <li class="active"><a href="#">发表文章</a></li>
        <li><a href="#">Analytics</a></li>
        <li><a href="#">Export</a></li>
    </ul>
@stop
@section('content')
    <h1>发表文章</h1>
    <form class="form-horizontal" method="post" action="/article">
        {!! csrf_field() !!}
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="title" placeholder="title" name="title">
                @if(isset($errors))
                <span class="help-block">
                    {{$errors->first('title')}}
                </span>
                @endif
            </div>
        </div>
        {{--<div class="form-group">--}}
        {{--<label for="inputEmail3" class="col-sm-2 control-label">摘要</label>--}}
        {{--<div class="col-sm-8">--}}
        {{--<input type="text" class="form-control" id="abstract" placeholder="abstract" name="abstract">--}}
        {{--</div>--}}
        {{--</div>--}}

        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">内容</label>
            <div class="col-sm-8">
                <textarea name="content" id="content" cols="120" rows="10"></textarea>
                @if(isset($errors) && $errors->has('content'))
                    <span class="help-block">
                    {{$errors->first('content')}}
                </span>
                    @endif
            </div>


        </div>


        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
@endsection