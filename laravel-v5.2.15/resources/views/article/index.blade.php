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
   <table class="table table-bordered">
       <tr>
           <td><input type="checkbox" id="check_article"><button class="btn btn-danger btn-xs delete_article">删除</button> </td>
           <td>id</td>
           <td>标题</td>
           <td>操作</td>

       </tr>
       @forelse($articles as $article)

           <tr>
               <td><input type="checkbox" name="check" value="{{$article->id}}"></td>
               <td>{{$article->id}}</td>
               <td>{{$article->title}}</td>
               <td><a href="{{url('article/'.$article->id)}}">详情</a>
               <a href="{{url('article/'.$article->id.'/edit')}}">编辑</a></td>


           </tr>
       @empty
           <tr>
               <td colspan="4" style="text-align: center">暂时没有记录</td>
           </tr>
         @endforelse

    </table>
@endsection
@section('script')
<script>
    {{--alert("{{session('create_success')}}");--}}


    @if(session()->has('create_success'))


    @endif


    $("#check_article").click(function ()
    {
        $("input[name=check]").prop('checked',$(this).prop('checked'));
    });
    $(".delete_article").click(function () {
        if(confirm("您确定要删除吗!")){
            var ids = [];
            $("input[name=check]:checked").each(function () {
                ids.push($(this).val());
            });
            console.log(ids);
        }
        $.post('/article/delete',{ids:ids,_method:"DELETE"},function (data) {
            if (data){
                $("input[name=check]:checked").parent().parent().remove()
            }
        })
    })
</script>
@stop