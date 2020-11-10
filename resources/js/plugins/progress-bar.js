import Vue from 'vue'
import VueProgressBar from 'vue-progressbar'

Vue.use(VueProgressBar, {
	color: '#77b6ff',
	failedColor: 'red',
	thickness: '2px',
	transition: {
		speed: '0.1s',
		opacity: '0s',
		termination: 100
	},
})