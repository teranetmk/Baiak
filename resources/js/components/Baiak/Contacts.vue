<template>
    <div class="baiak-contacts-top">
		<div class="container">
			<div class="baiak-contacts-left" v-if="Object.keys(locales).length > 1">
				<ul class="baiak-social-links-2">
					<a href="#" v-for="(value, key) in locales" :key="key" @click.prevent="setLocale(key)">
						<img :src="'/images/' + value + '.svg'" alt="" width="30px">
					</a>
				</ul>
			</div>
			<div class="baiak-contacts-right">
				<ul class="baiak-contacts-icons">
					<template v-if="authenticated">
						<li>
							<router-link :to="{ name: 'dashboard' }">
								<span class="fa fa-user fa-2x"></span>
							</router-link>
						</li>
						<li>
							<a href="#" @click.prevent="logout">
								<span class="fas fa-sign-out-alt fa-2x"></span>
							</a>
						</li>
					</template>
					<template v-else>
						<li>
							<router-link :to="{ name: 'login' }">
								<span class="fa fa-user fa-2x"></span>
							</router-link>
						</li>
						<li>
							<router-link :to="{ name: 'register' }">
								<span class="fa fa-user-plus fa-2x"></span>
							</router-link>
						</li>
					</template>
				</ul>
			</div>
		</div>
	</div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import { loadMessages } from '~/plugins/i18n'

export default {
	name: 'Contacts',

	computed: mapGetters({
		authenticated: 'auth/check',
		locale: 'lang/locale',
		locales: 'lang/locales'
	}),

	methods: {
		async logout () {
			try {
				// Log out the user.
				const { data } = await axios.post('/api/logout')

				this.$store.dispatch('auth/logout');
				// Redirect to login.
				this.$router.push({ name: 'login' })
				
				this.$toast.success(data.message);
			} catch (error) {
				this.$toast.error(error.response.data.message);
			}
		},

		setLocale (locale) {
			if (this.$i18n.locale !== locale) {
				loadMessages(locale)
				this.$store.dispatch('lang/setLocale', { locale })
			}
		}
	}
}
</script>