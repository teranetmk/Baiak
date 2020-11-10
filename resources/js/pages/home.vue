<template>
	<div>
		<template v-if="!authenticated">
			<div class="row vertical-gap">
				<div class="col-lg-4">
					<div class="baiak-feature-1">
						<router-link :to="{ name: 'login' }">
							<div class="baiak-feature-icon">
								<img src="/images/others/login.png" :alt="$t('login')">
							</div>
						</router-link>
						<div class="baiak-feature-cont">
							<h3 class="baiak-feature-title"><router-link :to="{ name: 'login' }">{{ $t('login') }}</router-link></h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="baiak-feature-1">
						<router-link :to="{ name: 'register' }">
							<div class="baiak-feature-icon">
								<img src="/images/others/create-account.png" :alt="$t('create_account')">
							</div>
						</router-link>
						<div class="baiak-feature-cont">
							<h3 class="baiak-feature-title"><router-link :to="{ name: 'register' }">{{ $t('create_account') }}</router-link></h3>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="baiak-feature-1">
						<router-link :to="{ name: 'password.request' }">
							<div class="baiak-feature-icon">
								<img src="/images/others/lost-account.png" :alt="$t('lost_account')">
							</div>
						</router-link>
						<div class="baiak-feature-cont">
							<h3 class="baiak-feature-title"><router-link :to="{ name: 'password.request' }">{{ $t('lost_account') }}</router-link></h3>
						</div>
					</div>
				</div>
			</div>
			<div class="baiak-gap"></div>
		</template>
		<template v-if="news.length">
			<v-title :title="$t('latest_news')"></v-title>
			<div class="baiak-news-box">
				<div class="baiak-news-box-list">
					<div class="nano">
						<div class="nano-content">
							<div class="baiak-news-box-item" v-for="(value, index) in news" :key="index" :class="{ 'baiak-news-box-item-active': index === 0 }">
								<div class="baiak-news-box-item-img">
									<img :src="'/images/news/' + value.id + '.png'" :alt="value.title">
								</div>
								<img :src="'/images/news/' + value.id + '.png'" class="baiak-news-box-item-full-img">
								<h3 class="baiak-news-box-item-title">{{ value.title }}</h3>
								<div class="baiak-news-box-item-text">
									<p v-html="value.description"></p>
								</div>
								<div class="baiak-news-box-item-date"><span class="fa fa-calendar"></span> {{ value.created_at }}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="baiak-news-box-each-info">
					<div class="nano">
						<div class="nano-content">
							<div class="baiak-news-box-item-image">
								<img :src="'/images/news/' + news[0]['id'] + '.png'" :alt="news[0]['title']">
							</div>
							<h3 class="baiak-news-box-item-title">{{ news[0]['title'] }}</h3>
							<div class="baiak-news-box-item-text">
								<p v-html="news[0]['description']"></p>
							</div>
							<div class="baiak-news-box-item-date">
								<span class="fa fa-calendar"></span> {{ news[0]['created_at'] }}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="baiak-gap"></div>
		</template>
		<template v-if="changelogs.length || topPlayers.length">
			<div class="row vertical-gap">
				<div class="col-lg-8" v-if="changelogs.length">
					<v-title :title="$t('changes_log')"></v-title>
					<div class="baiak-blog-grid">
						<div class="row">
							<div class="col-md-6" v-for="(value, index) in changelogs" :key="index">
								<div class="baiak-blog-post">
									<router-link :to="{ name: 'changelog.show', params: { slug: value.slug }}" class="baiak-post-img">
										<img :src="'/images/changeslog/' + value.id + '.png'" :alt="value.title">
									</router-link>
									<div class="baiak-gap"></div>
									<h2 class="baiak-post-title h4"><router-link :to="{ name: 'changelog.show', params: { slug: value.slug }}"><span v-html="value.title"></span></router-link></h2>
									<div class="baiak-post-by">
										<img src="/images/others/administrator.png"> by <a href="#">Administrator</a> in {{ value.created_at }}
									</div>
									<div class="baiak-gap"></div>
									<div class="baiak-post-text">
										<p v-html="value.description"></p>
									</div>
									<div class="baiak-gap"></div>
									<router-link :to="{ name: 'changelog.show', params: { slug: value.slug }}" class="baiak-btn baiak-btn-rounded baiak-btn-color-dark-3 baiak-btn-hover-color-main-1">{{ $t('read_more') }}</router-link>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4" v-if="topPlayers.length">
					<aside class="baiak-sidebar baiak-sidebar-right baiak-sidebar-sticky">
						<div class="baiak-widget baiak-widget-highlighted">
							<h4 class="baiak-widget-title"><span class="text-main-6">{{ $t('we_are_social') }}</span></h4>
							<div class="baiak-widget-content">
								<ul class="baiak-social-links-3 baiak-social-links-cols-4">
									<li><a class="baiak-social-facebook" target="_blank" href="https://www.facebook.com/www.baiak.com.br"><span class="fa fa-facebook"></span></a></li>
									<li><a class="baiak-social-flickr" target="_blank" href="https://www.instagram.com/baiak.com.br"><span class="fa fa-instagram"></span></a></li>
									<li><a class="baiak-social-youtube" target="_blank" href="https://www.youtube.com/channel/UCzy1qxxo891g9si2gOOW5FA"><span class="fa fa-youtube"></span></a></li>
									<li><a class="baiak-social-twitch" target="_blank" href="https://www.twitch.tv/baiakot"><span class="fa fa-twitch"></span></a></li>
								</ul>
							</div>
						</div>
						<div class="baiak-widget baiak-widget-highlighted">
							<h4 class="baiak-widget-title"><span><span class="text-main-6">Top 3</span> {{ $t('players') }}</span></h4>
							<div class="baiak-widget-content">
								<div class="baiak-widget-post" v-for="(value, index) in topPlayers" :key="index">
									<span class="baiak-post-outfit">
										<img :src="'/outfit.php?id=' + value.looktype +
											'&addons=' + value.lookaddons +
											'&head=' + value.lookhead +
											'&body=' + value.lookbody +
											'&legs=' + value.looklegs +
											'&feet=' + value.lookfeet +
											'&direction=3'
										">
									</span>
									<h3 class="baiak-post-title"><a href="#">{{ value.name }}</a></h3>
									<div class="baiak-post-informations">{{ $t('level') }}: {{ value.level }}<br>Vocation: {{ value.vocation_name }}</div>
								</div>
							</div>
						</div>
					</aside>
				</div>
			</div>
		</template>
	</div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'

export default {
	metaInfo () {
		return { 
			title: this.$t('home')
		}
	},

	data () {
		return {
			news: [],
			changelogs: [],
			topPlayers: []
		}
	},

	mounted() {
		
	},

	created () {
		this.fetchHomePage()
	},
	
	methods: {
		async fetchHomePage() {
			this.$Progress.start();

			try {
				const { data } = await axios.get('/api/home')
				this.news = data.news;
				this.changelogs = data.changelogs;
				this.topPlayers = data.topPlayers;
			} catch(error) {
				this.$toast.error(error.response.data.message);
			}

			this.$Progress.finish();
		}
	},

	computed: mapGetters({
		authenticated: 'auth/check'
	})
}
</script>
