<?php

namespace App\Http\Controllers\mobile;

use App\Http\Controllers\Controller;
use App\Models\favorite_model;
use App\Models\movie_model;
use Illuminate\Http\Request;

class favorite_controller extends Controller
{
    public function index(){
        $favorite =favorite_model::with(['movie'])->where('user_id',Auth()->user()->id)->get();
        return response()->json([
            'status'=>true,
            'favorite'=>$favorite,
        ]);
    }
    public function remove($id){
        $movie=movie_model::find($id);
        if($movie){
            $favorite=$movie->favorite()->where('user_id',Auth()->user()->id)->first();
            if(!$favorite){
                favorite_model::create([
                    'user_id'=>Auth()->user()->id,
                    'movie_id'=>$id,
                ]);
                return response()->json([
                    'message'=>'add favorite sucessfull',
                    'status'=>true,
                ]);
            }else{
                $favorite->delete();
                return response()->json([
                    'message'=>'unfavorite sucessfull',
                    'status'=>true,
                ]);
            }
        }else{
            return response()->json([
                'message'=>'not fount',
                'status'=>true,
            ]);
        }
    }
}
