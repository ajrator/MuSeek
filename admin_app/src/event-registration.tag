<event-registration>
	<section>
		<input name="eventName" type="text" placeholder="Event Name">
		<input name="startTime" type="text" placeholder="Start Time">
		<input name="endTime" type="text" placeholder="End Time">
		<input name="eventUrl" type="text" placeholder="Event URL">
		<button type="button" class="btn btn-default">Cancel</button>
		<button type="button" class="btn btn-default" onclick={ handleSubmit}>Create</button>
	</section>

	handleSubmit() {
		var payload = {
			name: this.eventName.value,
			startTime: this.startTime.value,
			endTime: this.endTime.value,
			eventUrl: this.eventUrl.value,
			bandId: Stores.currentBand.id
		}
		console.log("Event Added");
		console.log(payload);
		parent.items.push(payload);
	}
</event-registration>
