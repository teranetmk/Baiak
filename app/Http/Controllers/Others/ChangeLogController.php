<?php

namespace App\Http\Controllers\Others;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\ChangeLogs;

class ChangeLogController extends Controller
{
	public function show($slug)
	{
		$changelog = ChangeLogs::whereSlug($slug)->first();
        if(!$changelog) {
			return response()->json(['message' => 'This change log does not exist.'], 404);
		}
		
		return response()->json([
			'changelog' => $changelog
		]);
	}
}
