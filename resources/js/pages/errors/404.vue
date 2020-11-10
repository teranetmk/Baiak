<template>
	<div>
		<div class="baiak-main">
            <div class="baiak-fullscreen-block">
                <div class="baiak-fullscreen-block-top">
                    <div class="text-center">
                        <div class="baiak-gap-4"></div>
                        <router-link :to="{ name: 'home' }">
							<img src="/images/logo-small.png">
						</router-link>
                        <div class="baiak-gap-2"></div>
                    </div>
                </div>
                <div class="baiak-fullscreen-block-middle">
                    <div class="container text-center">
                        <div class="row">
                            <div class="col-md-6 offset-md-3 col-lg-4 offset-lg-4">
                                <h1 class="text-main-1" style="font-size: 150px;">404</h1>
                                <div class="baiak-gap"></div>
                                <h2 class="h4">You chose the wrong path!</h2>
                                <div>Or such a page just doesn't exist... <br> Would you like to go back to the homepage?</div>
                                <div class="baiak-gap-3"></div>
                                <router-link :to="{ name: 'home' }" class="baiak-btn baiak-btn-rounded baiak-btn-color-white">Return to Homepage</router-link>
                            </div>
                        </div>
                        <div class="baiak-gap-6"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="baiak-page-background-fixed" style="background-image: url('/images/bg-fixed-2.jpg');"></div>
	</div>
</template>

<script>
export default {
	layout: 'basic',
	name: 'NotFound'
}
</script>
