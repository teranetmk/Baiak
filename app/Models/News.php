<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;

class News extends Model
{
	protected $table = 'news';

	public function getCreatedAtAttribute($date)
	{
		return Carbon::parse($date)->format('d/m/Y, H:i:s');
	}

	public function getUpdatedAtAttribute($date)
	{
		return Carbon::parse($date)->format('d/m/Y, H:i:s');
	}
}
