<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class categories_model extends Model
{
    use HasFactory;
    protected $table = "categories";
    protected $primaryKey = "id";
    protected $fillable = [
        'id',
        'title',
        'image',
        'status',
    ];
    public function subcategories(){
        return $this->hasMany(subcategories_model::class,'categories_id');
    }
}
