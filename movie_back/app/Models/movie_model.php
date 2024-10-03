<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class movie_model extends Model
{
    use HasFactory;
    protected $table = "movie";
    protected $primaryKey = "id";
    protected $fillable = [
        'title',
        'description',
        'status',
        'image',
        'video',
        'subcategories_id',
    ];
    public function subcategories(){
        return $this->belongsTo(subcategories_model::class);
    }
    public function favorite(){
        return $this->hasMany(favorite_model::class,'movie_id');
    }
}
