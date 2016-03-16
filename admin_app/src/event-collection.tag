<event-collection>
	<div class="row">
		<div class="col-lg-12 text-center">
			<h2> My Events </h2>
		</div>
	</div>
	<div class="row">
		<div class="col-lg12 text-center">
			<h3>Add an event </h3>
			<event-registration></event-registration>
		</div>
	</div>
	<ul>
		<li each="{items}">
			<h3>{eventName}</h3>
			<p>{startTime}-{endTime}</p>
			<p>{eventUrl}</p>
		</li>
	</ul>

	var self = this;
	this.items = Stores.events;
	Stores.events.on('*', function(eventObj){
		console.log(eventObj);
		self.items.push.apply(Stores.events);
		self.update();
	})
	//this.items = [{"eventName": "Fart"}, {"eventName": "Morty" }];
</event-collection>
