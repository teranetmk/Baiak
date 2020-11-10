<template>
	<div>
		<vue-progress-bar></vue-progress-bar>
		<component :is="layout" v-if="layout" />
	</div>
</template>

<script>
import GlobalConfigs from '~/configs'

// Load layout components dynamically.
const requireContext = require.context('~/layouts', false, /.*\.vue$/)

const layouts = requireContext.keys()
  .map(file =>
    [file.replace(/(^.\/)|(\.vue$)/g, ''), requireContext(file)]
  )
  .reduce((components, [name, component]) => {
    components[name] = component.default || component
    return components
  }, {})

export default {
	el: '#baiak-root',

	components: {
		
	},

	data: () => ({
		layout: null,
		defaultLayout: 'default'
	}),

	metaInfo () {
		const { appName } = GlobalConfigs

		return {
			titleTemplate: `${appName} · %s`
		}
	},

	mounted () {
		
	},

	methods: {
		setLayout (layout) {
			if (!layout || !layouts[layout]) {
				layout = this.defaultLayout
			}

			this.layout = layouts[layout]
		}
	}
}
</script>
