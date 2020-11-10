<template>
	<nav class="baiak-navbar baiak-navbar-top baiak-navbar-sticky baiak-navbar-autohide">
		<div class="container">
			<div class="baiak-nav-table">
				<router-link :to="{ name: 'home'}" class="baiak-nav-logo">
					<img src="/images/logo.png" alt="Baiak" width="149">
				</router-link>
				<ul class="baiak-nav baiak-nav-right d-none d-lg-table-cell" data-nav-mobile="#baiak-nav-mobile">
					<li>
						<router-link :to="{ name: 'home'}">{{ $t('home') }}</router-link>
					</li>
					<li class="baiak-drop-item">
						<router-link to="#">{{ $t('community') }}</router-link>
						<ul class="dropdown">
							<li class=" baiak-drop-item">
								<!-- <router-link :to="{ name: 'character'}">Character</router-link> -->
								<ul class="dropdown">
									<!-- <li><router-link :to="{ name: 'character'}">Search</router-link></li>
									<li><router-link :to="{ name: 'character-buy'}">Buy</router-link></li>
									<li><router-link :to="{ name: 'character-sell'}">Sell</router-link></li> -->
								</ul>
							</li>
							<!-- <li><router-link :to="{ name: 'online-list'}">Who is online</router-link></li>
							<li><router-link :to="{ name: 'last-deaths'}">Last Deaths</router-link></li>
							<li><router-link :to="{ name: 'highscores'}">Highscores</router-link></li>
							<li><router-link :to="{ name: 'houses'}">Houses</router-link></li>
							<li><router-link :to="{ name: 'guilds'}">Guilds</router-link></li>
							<li><router-link :to="{ name: 'wars'}">Wars</router-link></li> -->
						</ul>
					</li>
					<li class="baiak-drop-item">
						<a href="#">{{ $t('videos') }}</a>
						<ul class="dropdown">
							<li><a href="casts.list">Live casts</a></li>
							<li><a href="cams.list">Recording Cams</a></li>
						</ul>
					</li>
					<li class="baiak-drop-item">
						<a href="#">{{ $t('library') }}</a>
						<ul class="dropdown">
							<li><a href="server-info.index">Server Info</a></li>
							<li><a href="server-rules.index">Server Rules</a></li>
						</ul>
					</li>
					<li class="baiak-drop-item">
						<a href="#">{{ $t('events') }}</a>
						<ul class="dropdown">
							<li><a href="events.bet-crazy.index">Bet Crazy</a></li>
							<li><a href="#">Capture The Flag</a></li>
							<li><a href="#">Battlefield</a></li>
							<li><a href="#">Desert War</a></li>
							<li><a href="#">SafeZone</a></li>
							<li><a href="#">Zombie</a></li>
							<li><a href="#">Bomberman</a></li>
							<li><a href="#">Blizzard</a></li>
							<li><a href="#">Assassination</a></li>
						</ul>
					</li>
					<li class="baiak-drop-item">
						<a href="#">{{ $t('shop') }}</a>
						<ul class="dropdown">
							<li><a href="buy-points.methods">Buy Points</a></li>
							<li><a href="shop.offer.index">Shop Offer</a></li>
							<li><a href="shop.cart.index">Cart</a></li>
						</ul>
					</li>
				</ul>
				<ul class="baiak-nav baiak-nav-right baiak-nav-icons">
					<li class="single-icon d-lg-none">
						<a href="#" class="no-link-effect" data-nav-toggle="#baiak-nav-mobile">
							<span class="baiak-icon-burger">
								<span class="baiak-t-1"></span>
								<span class="baiak-t-2"></span>
								<span class="baiak-t-3"></span>
							</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

</template>

<script>
    export default {
        name: 'NavBar'
    }
</script>