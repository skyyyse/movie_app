<?php

namespace App\Http\Controllers\mobile;

use App\Http\Controllers\Controller;
use App\Models\movie_model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class movie_controller extends Controller
{
    public function index(){
        $movie = movie_model::where('status',1)->get();
        return response()->json([
            'movie' => $movie,
            'status' => true,
        ]);
    }
    public function movie_id($id){
        $movie = movie_model::with(['favorite' => function($query) {
            $query->where('user_id', Auth()->user()->id);
        }])->where('status',1)->where('subcategories_id',$id)->get();
        return response()->json([
            'movie' => $movie,
            'status' => true,
        ]);
    }
    public function detail($id)
    {
        $movie = movie_model::with(['favorite' => function($query) {
            $query->where('user_id', Auth()->user()->id);
        }])->where('status',1)->where('id', $id)->get();
        return response()->json([
            'status' => true,
            'movie' => $movie,
        ]);
    }
}
