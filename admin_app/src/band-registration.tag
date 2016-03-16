<band-registration>
	<div class="row">
		<div class="col-lg-12 text-center">
			<h2>Sign up</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 text-center">
			<input name="bandName", type="text" placeholder="Band Name">
			<img name="bandImageUrl", class="profile-outline">
			<button type="button" class="btn btn-default" onclick="{handleSubmit}">Sign up</button>
		</div>
	</div>
	<div class="row">
	</div>

	self = this;
	self.currentBand = {};
	handleSubmit () {
		var payload = {
			id: 1,
			bandName: this.bandName.value,
			bandImageUrl: this.bandImageUrl.value
		};
		console.log("Band Registration Submitted");
		console.log(payload);
		Stores.addBand(payload);
		self.currentBand = Stores.bands[Stores.currentBand];
	}
</band-registration>

