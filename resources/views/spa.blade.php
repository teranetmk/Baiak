<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
    <head>
		<!-- ========================== Meta Tags =========================== -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="baiak has provided an MMORPG experience since February 2020. Fight powerful enemies, forge history, create everlasting friends and memories!">
		<meta name="keywords" content="baiak, baiak.net, baiak.com.br" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="{{ config('app.name') }}">
		<link rel="shortcut icon" type="image/png" href="{{ asset('images/favicon.png') }}"/>
		<!-- ========================== Title =========================== -->
		<title>{{ config('app.name') }}</title>
		<!-- ========================== Styles =========================== -->
		<link rel="stylesheet" type="text/css" href="{{ mix('css/all.css') }}">
		<!-- ========================== Pre-load scripts =========================== -->
        <script src="{{ mix('js/pre-load.js') }}"></script>
    </head>
    <body>
        <div id="baiak-root"></div>
		<!-- ========================== Application Scripts =========================== -->
		<script src="{{ mix('dist/js/app.js') }}"></script>
		<!-- ========================== Scripts =========================== -->
		<script src="{{ mix('js/all.js') }}"></script>
    </body>
</html>