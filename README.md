# MuSeek - Connect Local Artists with Fans

## Product Description

MuSeek connects "bored people" (ie. travels) with the local artists
currently performing in an area. They can check out the bands music and if
they like it, request a Lyft to the venue. Then they can engage further
with the band and donate money to them.

Bands can create events and link to the event details on other sites. They
can also link to their profiles on 3rd party sites. Some of this info will
probably be cached on our servers.

## Architecture

1. iOS Client:
 - Figures out users location
 - Queries our DB to request indie shows user could attend
 - Displays shows to the user
 - Displays "request a lyft" button
 - Prompts the user to donate to the band

2. Flask API Services + Redis Store
 - Stores a set of events indexed by location
 - Handles queries from the user asking for performances
 - Allows bands to post events

3. Static Site Service
 - Serves up a static splash page
 - Allows bands to log in
 
 4. Matchmaker Service
  - Given users and events arrays, return an array of events ranked by
	likelyhood the user would donate to the band
  - Determine the most likely time to hit the users up for money
