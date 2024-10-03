<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('movie', function (Blueprint $table) {
            $table->integer('id')->autoIncrement();
            $table->string('title')->nullable();
            $table->string('description')->nullable();
            $table->string('status')->nullable();
            $table->integer('image')->nullable();
            $table->string('video')->nullable();
            $table->integer('subcategories_id')->nullable();
            $table->foreign('subcategories_id')->references('id')->on('subcategories')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('movie');
    }
};
