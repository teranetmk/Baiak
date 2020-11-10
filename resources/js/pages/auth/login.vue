<template>
	<div>
		<v-title :title="$t('login')"></v-title>
		<form @submit.prevent="login" @keydown="form.onKeydown($event)">
			<div class="form-group">
				<label for="account_name">{{ $t('account_name') }}</label>
				<input v-model="form.account_name" :class="{ 'is-invalid': form.errors.has('account_name') }" class="form-control" type="password" name="account_name" :placeholder="$t('account_name')" autocomplete="off">
			</div>

			<div class="form-group">
				<label for="password">{{ $t('password') }}</label>
				<input v-model="form.password" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control" type="password" name="password" :placeholder="$t('password')" autocomplete="off">
			</div>

			<div class="row vertical-gap">
				<div class="col-md-6">
					<button type="submit" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-4 baiak-btn-hover-color-info baiak-btn-block" :disabled="form.busy">{{ $t('login') }}</button>
				</div>
				<div class="col-md-6">
					<router-link :to="{ name: 'password.request' }" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-4 baiak-btn-hover-color-info baiak-btn-block">{{ $t('forgot_password') }}</router-link>
				</div>
			</div>
		</form>
	</div>
</template>

<script>
import Form from 'vform'

export default {
	middleware: 'guest',

	metaInfo () {
		return { title: this.$t('login') }
	},

	data: () => ({
		form: new Form({
			account_name: '',
			password: ''
		}),
		remember: true
	}),

	created() {
		this.$Progress.start();
	},

	mounted() {
		this.$Progress.finish();
	},

	methods: {
		async login () {
			this.$Progress.start();
			
			try {
				// Submit the form.
				const { data } = await this.form.post('/api/login');

				// Save the token.
				this.$store.dispatch('auth/saveToken', {
					token: data.token,
					remember: this.remember
				});

				// Fetch the user.
				await this.$store.dispatch('auth/fetchUser');

				// Redirect
				this.$router.push({ name: 'dashboard' });
				this.$toast.success(data.message);
			} catch (error) {
				const data = error.response.data;
				const errors = data.errors;
				if(errors) {
					for (let index in errors) {
						let error = errors[index][0];
						this.$toast.error(error);
					}
				} else {
					this.$toast.error(data.message);
				}
			}

			this.$Progress.finish();
		}
	}
}
</script>
