<?php

namespace App\Http\Controllers\mobile;

use App\Http\Controllers\Controller;
use App\Models\categories_model;
use Illuminate\Http\Request;

class categories_controller extends Controller
{
    public function index(){
        $categories = categories_model::with('subcategories')->where("status",1)->get();
        return response()->json([
            'status'=>true,
            'categories'=>$categories,
        ]);
    }
}
