<band-registration>
	<h2>Sign up</h2>
	<input name="bandName", type="text" placeholder="Band Name">
	<img name="bandImageUrl", class="profile-outline">
	<button type="button" class="btn btn-default">Close</button>
	<button type="button" class="btn btn-default" onclick="{handleSubmit}">Sign up</button>
	
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

