<event-collection>
	<h2> My Events </h2>
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
