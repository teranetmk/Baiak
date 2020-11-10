<template>
	<div>
		<v-title :title="$t('reset_password')"></v-title>
		<form @submit.prevent="send" @keydown="form.onKeydown($event)">
			<div class="form-group">
				<label for="email">{{ $t('email') }}</label>
				<input v-model="form.email" :class="{ 'is-invalid': form.errors.has('email') }" class="form-control" type="email" name="email" :placeholder="$t('email')" autocomplete="off">
			</div>

			<div class="row vertical-gap">
				<div class="col-md-6">
					<button type="submit" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-4 baiak-btn-hover-color-info baiak-btn-block" :disabled="form.busy">{{ $t('submit') }}</button>
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
		return { title: this.$t('reset_password') }
	},

	data: () => ({
		form: new Form({
			email: ''
		})
	}),

	created() {
		this.$Progress.start();
	},

	mounted() {
		this.$Progress.finish();
	},

	methods: {
		async send() {
			this.$Progress.start();

			try {
				const { data } = await this.form.post('/api/password/email')
				this.$toast.success(data.status);
				this.form.reset();
			} catch(error) {
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
