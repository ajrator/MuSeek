var Stores = (function(){
  var stores = {};
  
  stores.bands = new Array;
  stores.events = new Array;

  stores.addEvent = function (payload){
    stores.events.push(payload);
  };

  stores.addBand = function(payload){
    stores.bands.push(payload);
  };

  return stores;

}());
