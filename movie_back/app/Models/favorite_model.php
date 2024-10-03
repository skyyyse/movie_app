<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class favorite_model extends Model
{
    use HasFactory;
    protected $table='favorite';
    protected $fillable=[
        'user_id',
        'movie_id',
    ];
    public function movie(){
        return $this->belongsTo(movie_model::class);
    }
    public function user(){
        return $this->belongsTo(related: User::class);
    }
}
