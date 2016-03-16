var Stores = (function(){
  var stores = {};
  
  stores.bands = riot.observable(new Array);
  stores.events = riot.observable(new Array);
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
