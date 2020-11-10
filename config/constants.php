<?php

return [
    'towns' => [
        1 => 'Baiak'
    ],

    'genders' => [
        1 => 'Male',
        0 => 'Female',
    ],

    'groups' => [
        1 => 'Player',
        2 => 'Tutor',
        3 => 'Senior Tutor',
        4 => 'Gamemaster',
        5 => 'Community Manager',
        6 => 'God',
        7 => 'Administrator',
    ],

    'level_create_guild' => 8,

    /*
    |--------------------------------------------------------------------------
    | Vocations
    |--------------------------------------------------------------------------
    |
    | ...
    |
    */

    'vocations' => [
        -1 => 'Any Vocation',
        0 => 'No Vocation',
        1 => 'Master Sorcerer',
        2 => 'Elder Druid',
        3 => 'Royal Paladin',
        4 => 'Elite Knight',
        5 => 'Baiak Sorcerer',
        6 => 'Baiak Druid',
        7 => 'Baiak Paladin',
        8 => 'Baiak Knight',
    ],

    'new_character_attributes' => [
        'level' => 8,
        'health' => 185,
        'mana' => 90,
        'experience' => 4200,
        'cap' => 470,
        'soul' => 100,
        'lookHead' => 79,
        'lookBody' => 0,
        'lookLegs' => 79,
        'lookFeet' => 79,
        'town_id' => 1
    ],

    'new_character_vocations' => [
        1 => 'Master Sorcerer',
        2 => 'Elder Druid',
        3 => 'Royal Paladin',
        4 => 'Elite Knight',
    ],

    'character_limit' => 7,
    'cast_viewers_limit' => 50,

    'payment_methods' => [
        'paypal' => [
            'client'   => env('PAYPAL_CLIENT_ID', ''),
            'secret'   => env('PAYPAL_SECRET', ''),
            'name'     => 'Baiak Points',
            'settings' => array(
                'mode' => env('PAYPAL_MODE', 'sandbox'),  // sanbox or live
            ),
        ],
        
        'pagseguro' => [
            'email' => env('PAGSEGURO_EMAIL', ''),
            'token' => env('PAGSEGURO_TOKEN', ''),
            'mode'  => env('PAGSEGURO_MODE', 'sandbox'),
            'name'  => 'Baiak Points',
        ],
        
        'mercadopago' => [
            'access_token' => env('MP_ACCESS_TOKEN', ''),
            'public_key'   => env('MP_PUBLIC_KEY', ''),
            'name'         => 'Baiak Points',
        ],
        
        'picpay' => [
            'token'        => env('PIC_PAY_TOKEN', ''),
            'seller_token' => env('PIC_PAY_SELLER_TOKEN', ''),
            'name'         => 'Baiak Points',
        ],
    ],

    'highscore' => [

        /*
        |--------------------------------------------------------------------------
        | Player group IDs to ignore.
        |--------------------------------------------------------------------------
        |
        |
        */

        'ignore-group-ids' => [4, 5, 6, 7],

        /*
        |--------------------------------------------------------------------------
        | Pagination per page
        |--------------------------------------------------------------------------
        |
        |
        */

        'per-page' => 15,

        /*
        |--------------------------------------------------------------------------
        | Holds the skills and its respective ID
        |--------------------------------------------------------------------------
        | 'url-param' => 'table-column' besides from experience & magic level, they
        |  are hard coded values.
        |
        */

        'skills' => [
            'experience'     => 7,
            'fist'             => 'skill_fist',
            'club'             => 'skill_club',
            'sword'             => 'skill_sword',
            'axe'             => 'skill_axe',
            'distance'         => 'skill_dist',
            'shielding'         => 'skill_shielding',
            'fishing'         => 'skill_fishing',
            'magiclevel'         => 8,
        ],

        /*
        |--------------------------------------------------------------------------
        | Holds the skills and its respective presentable
        |--------------------------------------------------------------------------
        | 'url-param' => 'presentable'
        |
        */

        'skills-presentable' => [
            'fist'             => 'Fist',
            'club'             => 'Club',
            'sword'             => 'Sword',
            'axe'             => 'Axe',
            'distance'         => 'Distance',
            'shielding'         => 'Shielding',
            'fishing'         => 'Fishing',
            'experience'     => 'Experience',
            'magiclevel'         => 'Magic Level',
        ],

    ],

    /*
   |--------------------------------------------------------------------------
   | OTServer IP.
   |--------------------------------------------------------------------------
   |
   | ...
   |
   */

    'ip' => env('SERVER_IP', ''),

    /*
    |--------------------------------------------------------------------------
    | OTServer IP.
    |--------------------------------------------------------------------------
    |
    | ...
    |
    */

    'port' => env('SERVER_PORT', ''),

    /*
    |--------------------------------------------------------------------------
    | Absolute path to your server directory.
    |--------------------------------------------------------------------------
    |
    | ...
    |
    */

    'path' => env('SERVER_PATH', ''),

    'community' => [
        /*
        |--------------------------------------------------------------------------
        | Latest Deaths: enable or disable pagination.
        |--------------------------------------------------------------------------
        |
        |
        */

        'deaths-pagination' => true,

        /*
        |--------------------------------------------------------------------------
        | Latest Deaths: amount of deaths to show per page.
        |--------------------------------------------------------------------------
        |
        |
        */

        'deaths-per-page' => 40,
    ],

    'premdays' => 0,

    'war_status' => [
        0 => 'Pending',
        1 => 'Accepted',
        2 => 'Rejected',
        3 => 'Cancelled',
        4 => 'Ended by kill limit',
        5 => 'Ended',
    ],
];