<template>
	<div>
		<div v-if="title">
			<h3 :class="[`baiak-decorated-${decorated}`]"><span :class="[`text-main-${text}`]">{{ title }}</span></h3>
		</div>
		<div class="baiak-gap"></div>
	</div>
</template>

<script>
export default {
	name: 'VTitle',

	props: {
		title: { 
			type: String, 
			default: null 
		},

		decorated: {
			type: String,
			default: 'h'
		},

		text: {
			type: String,
			default: '6'
		},
	}
}
</script>
