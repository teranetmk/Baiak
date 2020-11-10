import Vue from 'vue'
import VTitle from './Baiak/components/Title'

// Components that are registered globaly.
[
	VTitle
].forEach(Component => {
  Vue.component(Component.name, Component)
})
