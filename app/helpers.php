<?php
if (! function_exists('convertGold')) {
    function convertGold($gold) {
        $string = "";
        if ($gold >= 1000000000) {
            $string = round($gold/1000000000,2).'kkk';
        } elseif ($gold >= 1000000) {
            $string = round($gold/1000000,2).'kk';
        } elseif ($gold >= 50000) {
            $string = round($gold/1000,2).'k';
        } elseif ($gold >= 1000) {
            $string = round($gold/1000,2).'k';
        } elseif ($gold < 1000) {
            $string = $gold . 'gps';
        }
        return $string;
    }
}

if (! function_exists('getSexOutFit')) {
    function getSexOutFit($sex)
    {
        // Male
        if ($sex == 1) return 128;

        // Female
        return 136;
    }
}

if (! function_exists('getOutFitGen')) {
    function getOutFitGen($gen)
    {
        // Male
        if ($gen == 128) return 1;

        // Female
        return 0;
    }
}

if (! function_exists('group_info')) {
    function group_info($group_id)
    {
        return \Config::get('constants.groups')[$group_id];
    }
}

if (! function_exists('sex_info')) {
    function sex_info($sexId)
    {
        return \Config::get('constants.genders')[$sexId];
    }
}

if (! function_exists('town_info')) {
    function town_info($town_id){
        return \Config::get('constants.towns')[$town_id];
    }
}


if (! function_exists('getVocationNameById')) {
    function getVocationNameById($id)
    {
        return \Config::get('constants.vocations')[$id] ?? null;
    }
}

if (! function_exists('ingame_positions')) {
    function ingame_positions($id)
    {
        return \Config::get('constants.ingame_positions')[$id] ?? null;
    }
}

if (! function_exists('getOnlinePlayers')) {
    /**
     * Get online players.
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    function getOnlinePlayers()
    {
        //return \Cache::remember('players:online', 60, function () {
            echo App\Game\PlayersOnline::count();
        //});
    }
}

if (! function_exists('str_e')) {
    /**
     * Convert a value to a more friendly version.
     *
     * @param  string $value
     * @param  array $arguments []
     * @return string
     */
    function str_e($value, array $arguments = [], $lower = true)
    {
        foreach ($arguments as $key => $argument) {
            $value = preg_replace(
                '/\:'.preg_quote($key, '/').'/i',
                ($lower) ? strtolower($argument) : $argument, $value
            );
        }

        return $value;
    }
}

if (! function_exists('product_image')) {
    function product_image($product_id, $product_type)
    {
        switch ($product_type) {
            case 1:
                return asset('images/items/'.trim($product_id).'.gif');
            break;

            default:
                return asset('images/store/'.trim($product_id).'.gif');
            break;
        }
    }
}

if (! function_exists('category_image')) {
    function category_image($slug)
    {
       return asset('images/store-categories/'.trim($slug).'.gif');
    }
}

if (! function_exists('secondsToTime')) {
    function secondsToTime($inputSeconds)
    {
        $secondsInAMinute = 60;
        $secondsInAnHour = 60 * $secondsInAMinute;
        $secondsInADay = 24 * $secondsInAnHour;

        // Extract days
        $days = floor($inputSeconds / $secondsInADay);

        // Extract hours
        $hourSeconds = $inputSeconds % $secondsInADay;
        $hours = floor($hourSeconds / $secondsInAnHour);

        // Extract minutes
        $minuteSeconds = $hourSeconds % $secondsInAnHour;
        $minutes = floor($minuteSeconds / $secondsInAMinute);

        // Extract the remaining seconds
        $remainingSeconds = $minuteSeconds % $secondsInAMinute;
        $seconds = ceil($remainingSeconds);

        // Format and return
        $timeParts = [];
        $sections = [
            'day' => (int)$days,
            'hour' => (int)$hours,
            'minute' => (int)$minutes,
            'second' => (int)$seconds,
        ];

        foreach ($sections as $name => $value){
            if ($value > 0){
                $timeParts[] = $value. ' '.$name.($value == 1 ? '' : 's');
            }
        }

        return implode(', ', $timeParts);
    }
}

if (! function_exists('getVocationIdBySlug')) {
    function getVocationIdBySlug($slug)
    {
        return \Config::get('slugs.vocations')[$slug] ?? null;
    }
}

if (! function_exists('getTownIdBySlug')) {
    function getTownIdBySlug($slug)
    {
        return \Config::get('slugs.towns')[$slug] ?? null;
    }
}
?>
