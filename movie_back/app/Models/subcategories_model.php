<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subcategories_model extends Model
{
    use HasFactory;
    protected $table="subcategories";
    protected $primaryKey = "id";
    protected $fillable = [
        "title ",
        "image,",
        'categories_id ',
        "status",
    ];
    public function categories(){
        return $this->belongsTo(categories_model::class);
    }
    public function movie(){
        return $this->hasMany(movie_model::class,'movie_id');
    }
}
