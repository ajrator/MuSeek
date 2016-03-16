var Stores = (function(){
  var stores = {};
  
  stores.bands = new Array;
  stores.events = new Array;
  stores.currentBand = 0; // index of current band

  stores.addEvent = function (payload){
    stores.events.push(payload);
  };

  stores.addBand = function(payload){
    stores.bands.push(payload);
    stores.currentBand = stores.bands.length - 1;
  };

  return stores;

}());
