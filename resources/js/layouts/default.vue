<template>
	<div class="main-layout">
		<Header />
		<NavBarMobile />
		<div class="baiak-main">
			<div class="container">
				<div class="baiak-gap"></div>
				<router-view></router-view>
				<div class="baiak-gap-2"></div>
			</div>
			<Footer />
		</div>
		<img class="baiak-page-background-top" src="/images/background.png" alt="">
	</div>
</template>

<script>
import Header from '~/components/Baiak/Header.vue';
import NavBarMobile from '~/components/Baiak/NavBarMobile.vue';
import Footer from '~/components/Baiak/Footer.vue';

export default {
	name: 'MainLayout',

	components: {
		Header,
		NavBarMobile,
		Footer
	}
}
</script>
