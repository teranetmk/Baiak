<template>
	<div>
		<v-title :title="$t('register')"></v-title>
		<form @submit.prevent="register" @keydown="form.onKeydown($event)">
			<div class="form-group">
				<label for="account_name">{{ $t('account_name') }}</label>
				<input v-model="form.account_name" :class="{ 'is-invalid': form.errors.has('account_name') }" class="form-control" type="text" name="account_name" :placeholder="$t('account_name')" autocomplete="off">
			</div>

			<div class="form-group">
				<label for="password">{{ $t('password') }}</label>
				<input v-model="form.password" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control" type="password" name="password" :placeholder="$t('password')" autocomplete="off">
			</div>

			<div class="form-group">
				<label for="password_confirmation">{{ $t('confirm_password') }}</label>
				<input v-model="form.password_confirmation" :class="{ 'is-invalid': form.errors.has('password') }" class="form-control" type="password" name="password_confirmation" :placeholder="$t('confirm_password')" autocomplete="off">
			</div>

			<div class="form-group">
				<label for="email">{{ $t('email') }}</label>
				<input v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control" type="email" name="email" :placeholder="$t('email')" autocomplete="off">
			</div>

			<div class="row vertical-gap">
				<div class="col-md-6">
					<button type="submit" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-4 baiak-btn-hover-color-info baiak-btn-block" :disabled="form.busy">{{ $t('register') }}</button>
				</div>
				<div class="col-md-6">
					<router-link :to="{ name: 'home' }" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-4 baiak-btn-hover-color-info baiak-btn-block">{{ $t('back') }}</router-link>
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
		return { title: this.$t('register') }
	},

	data: () => ({
		form: new Form({
			account_name: '',
			email: '',
			password: '',
			password_confirmation: ''
		})
	}),

	created() {
		this.$Progress.start();
	},

	mounted() {
		this.$Progress.finish();
	},

	methods: {
		async register () {
			this.$Progress.start();
			try {
				// Register the user.
				const { data } = await this.form.post('/api/register');

				// Log in the user.
				const { data: { token } } = await this.form.post('/api/login');

				// Save the token.
				this.$store.dispatch('auth/saveToken', { token });

				// Update the user.
				await this.$store.dispatch('auth/updateUser', { user: data.user });

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
