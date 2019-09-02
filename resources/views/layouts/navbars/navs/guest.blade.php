<!-- Navbar -->
<nav>
    <div class="nav-wrapper">
        <a href="{{ route('home') }}" class="brand-logo">{{ config('app.name', 'Laravel')}}</a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="{{ route('pedidos') }}">{{ __('Meus Pedidos')}}<i class="material-icons left">shopping_cart</i></a>
      </ul>
    </div>
  </nav>

  <ul class="sidenav" id="mobile-demo">
    <li><a href="{{ route('pedidos') }}">{{ __('Meus Pedidos')}}<i class="material-icons left">shopping_cart</i></a>
    </ul>
<!-- End Navbar -->