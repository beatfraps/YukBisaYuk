<?php

namespace App\Domain\Event\Entity;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Petition extends Model
{
    // konfigurasi ORM
    use HasFactory;
    protected $table = 'petition';
    protected $guarded = ['id'];
    public $timestamps = false;

    // Relasi
    public function participatepetition()
    {
        return $this->hasMany(ParticipatePetition::class);
    }

    public function updatenews()
    {
        return $this->hasMany(UpdateNews::class);
    }
}
