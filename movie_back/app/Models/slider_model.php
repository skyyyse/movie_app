<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class slider_model extends Model
{
    use HasFactory;
    protected $table = "slider";
    protected $primaryKey = "id";
    protected $fillable = [
        "title",
        "image",
        'status',
    ];
}
