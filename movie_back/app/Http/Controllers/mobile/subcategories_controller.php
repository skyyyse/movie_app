<?php

namespace App\Http\Controllers\mobile;

use App\Http\Controllers\Controller;
use App\Models\subcategories_model;
use Illuminate\Http\Request;

class subcategories_controller extends Controller
{
    public function index($id){
        $subcategories = subcategories_model::where('categories_id',$id)->where('status',operator: 1)->get();
        return response()->json([
            'status'=>true,
            'subcategories'=>$subcategories,
        ]);
    }
}
