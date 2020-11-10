<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;

class Players extends Model
{
	protected $table = 'players';

	protected $appends = [
		'vocation_name'
	];

	protected $visible = [
		'name',
		'slug',
		'level',
		'health',
		'healthmax',
		'experience',
		'lookbody',
		'lookfeet',
		'lookhead',
		'looklegs',
		'looktype',
		'lookaddons',
		'direction',
		'maglevel',
		'mana',
		'manamax',
		'soul',
		'cap',
		'lastlogin',
		'online',
		'skull',
		'lastlogout',
		'balance',
		'comment',
		'stamina',
		'dodges',
		'criticals',
		'castviewers',
		'castdescription',
		'caststatus',
		'skill_fist',
		'skill_club',
		'skill_sword',
		'skill_axe',
		'skill_dist',
		'skill_shielding',
		'skill_fishing',
		'outfits',
		'quests',
		'tasks',
		'created_at',
		'vocation_name',
	];
	
	public function getCreatedAtAttribute($date)
	{
		return Carbon::parse($date)->format('d/m/Y, H:i:s');
	}

	public function getVocationNameAttribute()
	{
		return getVocationNameById($this->vocation_id) ?? 'None';
	}
}
