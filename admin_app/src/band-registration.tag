<band-registration>
	<input name="bandName", type="text" placeholder="Band Name">
	<img name="bandImageUrl", class="profile-outline">
	<button type="button" class="btn btn-default">Close</button>
	<button type="button" class="btn btn-default" onclick="{handleSubmit}">Sign up</button>

	handleSubmit () {
		var payload = {
			id: (Stores.bands.length + 1),
			bandName: this.bandName.value,
			bandImageUrl: this.bandImageUrl.value
		};
		console.log("Band Registration Submitted");
		console.log(payload);
		Stores.addBand(payload);
	}
</band-registration>

