<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;

class ChangeLogs extends Model
{
    protected $table = 'changelogs';

	public function getCreatedAtAttribute($date)
	{
		return Carbon::parse($date)->format('d/m/Y, H:i:s');
	}

	public function getUpdatedAtAttribute($date)
	{
		return Carbon::parse($date)->format('d/m/Y, H:i:s');
	}
}
