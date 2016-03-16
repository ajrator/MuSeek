<event-registration>
	<section>
		<input name="eventName" type="text" placeholder="Event Name">
		<input name="startTime" type="text" placeholder="Start Time">
		<input name="endTime" type="text" placeholder="End Time">
		<input name="eventUrl" type="text" placeholder="Event URL">
		<button type="button" class="btn btn-default" onclick={ handleSubmit}>Create</button>
	</section>

	handleSubmit() {
		var payload = {
			eventName: this.eventName.value,
			startTime: this.startTime.value,
			endTime: this.endTime.value,
			eventUrl: this.eventUrl.value,
			bandId: Stores.currentBand.id
		}
		console.log("Event Added");
		console.log(payload);
		Stores.addEvent(payload);
		Stores.events.trigger('update');

	}
</event-registration>
