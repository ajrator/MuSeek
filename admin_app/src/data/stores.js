var Stores = (function(){
  var stores = {};
  
  stores.bands = riot.observable(new Array);
  stores.events = riot.observable(
      [{
	eventName: "Carson McHone",
	startTime: "4:00PM",
	endTime: "5:00PM",
	cost: "Free",
	eventUrl: "carsonmchonemusic.com"
	},
	{
	 eventName: "American Sharks",
         startTime: "5:00PM",
	 endTime: "7:00PM",
	 cost: "Free",
	 eventUrl: "sharkspartyhard.com",
	},
	{
	 eventName: "Clara Nova",
         startTime: "12:00PM",
	 endTime: "2:00PM",
	 cost: "Free",
	 eventUrl: "clara-nova.com",
	},
	{
	  eventName: "The SideWider",
          startTime: "1:00AM",
	  endTime: "3:00AM",
	  cost: "Free",
	  eventUrl: "holidaymountainmusic.com"
        }
  ]);
  stores.currentBand = 0; // index of current band

  stores.events.on('update');
  
  stores.addEvent = function (payload){
    stores.events.push(payload);
  };

  stores.addBand = function(payload){
    stores.bands.push(payload);
    stores.currentBand = stores.bands.length - 1;
  };

  return stores;

}());
