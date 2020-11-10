<template>
	<header class="baiak-header baiak-header-opaque">
		<Contacts />
		<NavBar />
	</header>
</template>

<script>
	import Contacts from '~/components/Baiak/Contacts.vue';
	import NavBar from '~/components/Baiak/NavBar.vue';
    export default {
		name: 'Header',
		components: {
			Contacts,
			NavBar
		}
    }
</script>