<?php

namespace App\Http\Controllers;

use App\Article;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Session;
use Mockery\CountValidator\Exception;

class ArticleController extends Controller
{
    public  function store(Request $request){
        $this->validate($request, [
                'title' => 'min:6|required',
                'content' => 'required',
            ]);

     $article = Article::create($request->all());

        if ($article){
            return redirect('/article')->with(['create_success'=>"创建成功!"]);
        }
    }

    public function index(){
        
        $articles = Article::all();
        return view('article.index',compact('articles'));
    }
    public function destroy(Request $request){
       $res = Article::whereIN('id',$request->ids)->delete();
        if ($res){
            return $res;
        }
    }
    public function create(){
        Session::put('111',11);
        var_dump( Session::all());
        return view('article.create');
    }

    public function edit($id){
        $article = Article::findOrFail($id);
        return view('article.edit',compact('article'));
    }

    public function update(Request $request, $id)
    {
        $data['title'] = $request->title;
        $data['content'] = $request->input('content');
       $res = Article::where('id',$id)->update($data);
        if ($res){
            return redirect('/article')->with(['create_success'=>"更新成功!"]);
        }
    }

    public  function show($id){
        $article = Article::findOrFail($id);
        return view('article.show',compact('article'));
    }
}
