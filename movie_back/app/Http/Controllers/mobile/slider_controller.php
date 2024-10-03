<?php

namespace App\Http\Controllers\mobile;

use App\Http\Controllers\Controller;
use App\Models\slider_model;
use Illuminate\Http\Request;
class slider_controller extends Controller
{
    public function index(){
        $slider=slider_model::where("status",operator: 1)->get();
        return response()->json([
            'status'=>true,
            'slider'=>$slider,
        ]);
    }
}
