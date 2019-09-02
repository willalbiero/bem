<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>{{ config('app.name', 'Laravel') }}</title>
    <!-- CSS Files -->
    <link href="{{ asset('css')}}/app.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    </head>
    <body class="{{ $class ?? '' }}">
        @guest()
            @include('layouts.page_templates.guest')
        @endguest
    
        <script src="{{ asset('js') }}/app.js"></script>
        @stack('js')
    </body>
</html>