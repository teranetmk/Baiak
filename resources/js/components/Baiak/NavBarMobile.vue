<template>
	<div id="baiak-nav-mobile" class="baiak-navbar baiak-navbar-side baiak-navbar-right-side baiak-navbar-overlay-content d-lg-none">
		<div class="nano">
			<div class="nano-content">
				<router-link :to="{ name: 'home' }" class="baiak-nav-logo">
					<img src="/images/logo.png" alt="" width="120">
				</router-link>
				<div class="baiak-navbar-mobile-content">
					<ul class="baiak-nav"></ul>
				</div>
			</div>
		</div>
	</div>

</template>

<script>
    export default {
        name: 'NavBarMobile'
    }
</script>