<template>
	<div v-if="changelog">
		<v-title :title="$t('change_log') + ' #' + changelog.id"></v-title>
		<div class="baiak-blog-fullwidth">
			<div class="baiak-blog-post">
				<div class="baiak-post-img text-center">
					<img :src="'/images/changeslog/' + changelog.id + '.png'" :alt="changelog.title">
				</div>
				<div class="baiak-gap-2"></div>
				<div class="row vertical-gap">
					<div class="col-md-8 col-lg-9">
						<h2 class="baiak-post-title h4" v-html="changelog.title"></h2>
						<div class="baiak-gap"></div>
						<div class="baiak-post-text">
							<p v-html="changelog.description"></p>
						</div>
					</div>
					<div class="col-md-4 col-lg-3">
						<div class="baiak-post-by">
							<img src="/images/others/administrator.png" alt="Administrator" width="60"> by <span class="text-main-1 font-weight-bold">Administrator</span>
							<br> in {{ changelog.created_at }}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import axios from 'axios'

export default {
	props: {
		slug: {
			type: String,
			required: true
		},
	},

	metaInfo () {
		return { 
			title: this.$t('change_log')
		}
	},

	data () {
		return {
			changelog: null
		}
	},

	created () {
		this.getChangeLog()
	},
	
	methods: {
		async getChangeLog() {
			this.$Progress.start();
			try {
				const { data } = await axios.get('/api/changelog/' + this.slug)
				this.changelog = data.changelog;
				this.$Progress.finish();
			} catch(error) {
				this.$toast.error(error.response.data.message);
				this.$Progress.finish();
			}
		}
	}
}
</script>
