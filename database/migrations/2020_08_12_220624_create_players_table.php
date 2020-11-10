<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlayersTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('players', function (Blueprint $table) {
			$table->id();
			$table->string('name')->collation('utf8_general_ci');
			$table->string('slug')->collation('utf8_general_ci')->nullable();
			$table->unsignedSmallInteger('group_id')->default(1);
			$table->integer('account_id')->default(0);
			$table->integer('level')->default(1);
			$table->unsignedSmallInteger('vocation_id')->default(0);
			$table->integer('health')->default(150);
			$table->integer('healthmax')->default(150);
			$table->unsignedBigInteger('experience')->default(0);
			$table->unsignedTinyInteger('lookbody')->default(0);
			$table->unsignedTinyInteger('lookfeet')->default(0);
			$table->unsignedTinyInteger('lookhead')->default(0);
			$table->unsignedTinyInteger('looklegs')->default(0);
			$table->unsignedSmallInteger('looktype')->default(136);
			$table->unsignedTinyInteger('lookaddons')->default(0);
			$table->unsignedTinyInteger('direction')->default(2);
			$table->unsignedInteger('maglevel')->default(0);
			$table->unsignedInteger('mana')->default(0);
			$table->unsignedInteger('manamax')->default(0);
			$table->unsignedBigInteger('manaspent')->default(0);
			$table->unsignedTinyInteger('soul')->default(0);
			$table->unsignedInteger('town_id')->default(1);
			$table->unsignedSmallInteger('posx')->default(0);
			$table->unsignedSmallInteger('posy')->default(0);
			$table->unsignedTinyInteger('posz')->default(0);
			$table->binary('conditions')->nullable();
			$table->unsignedInteger('cap')->default(400);
			$table->unsignedTinyInteger('sex')->default(0);
			$table->unsignedBigInteger('lastlogin')->default(0);
			$table->unsignedInteger('lastip')->default(0);
			$table->tinyInteger('save')->default(1);
			$table->tinyInteger('online')->default(0);
			$table->tinyInteger('skull')->default(0);
			$table->bigInteger('skulltime')->default(0);
			$table->unsignedBigInteger('lastlogout')->default(0);
			$table->tinyInteger('blessings')->default(0);
			$table->unsignedBigInteger('onlinetime')->default(0);
			$table->unsignedBigInteger('balance')->default(0);
			$table->string('comment')->collation('utf8mb4_unicode_ci')->nullable()->default('');
			$table->tinyInteger('hidden')->default(0);
			$table->unsignedSmallInteger('offlinetraining_time')->default(43200);
			$table->integer('offlinetraining_skill')->default(-1);
			$table->unsignedSmallInteger('stamina')->default(2520);
			$table->unsignedSmallInteger('dodges')->default(0);
			$table->unsignedSmallInteger('criticals')->default(0);
			$table->tinyInteger('talk_himself')->default(0);
			$table->integer('party_id')->default(0);
			$table->integer('castviewers')->default(0);
			$table->string('castdescription')->collation('utf8_general_ci')->default('');
			$table->integer('caststatus')->default(0);
			$table->unsignedSmallInteger('skill_fist')->default(10);
			$table->unsignedBigInteger('skill_fist_tries')->default(0);
			$table->unsignedSmallInteger('skill_club')->default(10);
			$table->unsignedBigInteger('skill_club_tries')->default(0);
			$table->unsignedSmallInteger('skill_sword')->default(10);
			$table->unsignedBigInteger('skill_sword_tries')->default(0);
			$table->unsignedSmallInteger('skill_axe')->default(10);
			$table->unsignedBigInteger('skill_axe_tries')->default(0);
			$table->unsignedSmallInteger('skill_dist')->default(10);
			$table->unsignedBigInteger('skill_dist_tries')->default(0);
			$table->unsignedSmallInteger('skill_shielding')->default(10);
			$table->unsignedBigInteger('skill_shielding_tries')->default(0);
			$table->unsignedSmallInteger('skill_fishing')->default(10);
			$table->unsignedBigInteger('skill_fishing_tries')->default(0);
			$table->json('outfits')->nullable();
			$table->json('quests')->nullable();
			$table->json('tasks')->nullable();
			$table->binary('spells')->nullable();

			$table->timestamp('deleted_at')->nullable();
			$table->timestamp('created_at')->nullable();
		});
		
		DB::statement("ALTER TABLE `players` ADD `storages` MEDIUMBLOB AFTER `spells`;");
		DB::statement("ALTER TABLE `players` ADD `items` LONGBLOB AFTER `storages`;");
		DB::statement("ALTER TABLE `players` ADD `depot_items` LONGBLOB AFTER `items`;");
		DB::statement("ALTER TABLE `players` ADD `inbox_items` LONGBLOB AFTER `depot_items`;");
    }

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('players');
	}
}
