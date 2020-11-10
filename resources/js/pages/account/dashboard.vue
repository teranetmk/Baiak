<template>
  <div>
	  <v-title :title="$t('account_dashboard')"></v-title>
  </div>
</template>

<script>
export default {
	middleware: 'auth',

	metaInfo () {
		return { 
			title: this.$t('account_dashboard')
		}
	},

	data: () => ({
		
	})
}
</script>
