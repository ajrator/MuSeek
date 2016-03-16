/* Javascript API Client for MuSeek app*/

var Api = (function(){
  var api = {};
  api.buildRequest = function (body){
    return {
	  'method': 'POST',
	  'body': JSON.stringify(body),
	  'headers': {'Accept: */*', 'Content-Type': 'application/json/'}
	};
  /*
   * Do a fetch request useing the wg fetch polyfill and ajax lib
   * */
  api.fetch(url, body){
    var readOptions = this.buildRequest(body);
  };

  }
  /* Create a new Band Record 
   * @param{string} bandName
   * @param {string} bandImageUrl Image for the Bands profile
   * @return {promise} The Promise returned by Fetch ajax call
   */
  api.createBand(bandName, bandImageUrl){
		var url = '/bands';
		var payload = {
			'data': {
				'type': 'Band',
				'attributes': {
					'name': bandName,
					'imageUrl': bandImageUrl
				},
			}
		}
	return this.fetch(url, payload).
		then(json, read);
	}
	/*
	 * Create a new event record
	 * @param {string} eventName The Name of the event
	 * @param {DateTime} eventStart
	 * @param {DateTime} eventEnd
	 * @param {Venue} eventVenue The location of the event
	 */
	createEvent(eventName, eventStart, eventEnd, eventVenue, bandId){
		var url = '/events';
		// You will need to stringify the DateTime Objects
		var payload = {
			'data': {
				'type': 'Event',
				'attributes':{
					'name': eventName,
					'start': eventStart,
					'end': eventEnd,
					'venue': eventVenue,
				}
			},
			'relationships':{
				'band': {
					'data': {'type': 'Band', 'id': bandId}
				}
			}
		}
	}
}
