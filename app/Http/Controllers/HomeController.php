<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\News;
use App\Models\ChangeLogs;
use App\Models\Players;

class HomeController extends Controller
{
    public function index()
    {
		$changelogs = ChangeLogs::orderBy('created_at', 'DESC')->limit(2)->get();
		$news       = News::orderBy('created_at', 'DESC')->limit(10)->get();
		$topPlayers = Players::where('group_id', '<', 3)->orderBy('level', 'desc')->limit(3)->get();

        return response()->json([
			'news'       => $news,
			'changelogs' => $changelogs,
			'topPlayers' => $topPlayers
		]);
    }
}
