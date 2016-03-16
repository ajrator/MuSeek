import requests
import json

SAMPLE_EVENT_PAYLOADS = [
    {
        'data': {
            'type': 'Event',
            'attributes': {
                'name': 'B & S Secret Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'The Center'
            },
        },
        'relationships': {
            'band': {
                    'data': {'type': 'Band', 'id': 0}
            }
        }
    },
    {
        'data': {
            'type': 'Event',
            'attributes': {
                'name': 'Super Indie Time',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'Cabin Cabin'
            },
        },
        'relationships': {
            'band': {
                    'data': {'type': 'Band', 'id': 1}
            }
        }
    },
    {
        'data': {
            'type': 'Event',
            'attributes': {
                'name': 'Super Indie Time Day 2',
                'start': '17-03-15T19:00:00',
                'end': '17-03-15T22:00:00',
                'venue': 'Cabin Cabin'
            },
        },
        'relationships': {
            'band': {
                    'data': {'type': 'Band', 'id': 1}
            }
        }
    },
    {
        'data': {
            'type': 'Event',
            'attributes': {
                'name': 'Surprise Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'Russian House'
            },
        },
        'relationships': {
            'band': {
                    'data': {'type': 'Band', 'id': 2}
            }
        }
    }
]


def test_api():
    """Check if the API is on.
    """
    r = requests.get('http://localhost:8000/clear')
    r = requests.get('http://localhost:8000')

    assert r.status_code==200

def test_event_post():
    """Check if adding events works."""
    status_codes = []
    for payload in SAMPLE_EVENT_PAYLOADS:
        r = requests.post('http://localhost:8000/events', data=json.dumps(payload),
                headers={'Content-Type': 'application/json'} )
        status_codes.append(r.status_code)
    assert [status_code == 201 for status_code in status_codes]

def test_events_get():
    """Check if getting all events works."""
    r = requests.get('http://localhost:8000/events')
    res = json.loads(r.text)
    assert res == {"events":[{"id": 0,
                'name': 'B & S Secret Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'The Center',
                'band_id': 0},
                {"id": 1,
                'name': 'Super Indie Time',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'Cabin Cabin',
                'band_id': 1},
                {"id": 2,
                'name': 'Super Indie Time Day 2',
                'start': '17-03-15T19:00:00',
                'end': '17-03-15T22:00:00',
                'venue': 'Cabin Cabin',
                'band_id': 1},
                {"id": 3,
                'name': 'Surprise Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'Russian House',
                'band_id': 2}]}

def test_event_get():
    """Check if getting one event works."""
    r = requests.get('http://localhost:8000/events/1')
    res = json.loads(r.text)
    assert res == {"event": {"id": 1,
                    'name': 'Super Indie Time',
                    'start': '16-03-15T19:00:00',
                    'end': '16-03-15T22:00:00',
                    'venue': 'Cabin Cabin',
                    'band_id': 1}}

def test_event_delete():
    """Check if deleting one event works."""
    r = requests.delete('http://localhost:8000/events/1')
    res = json.loads(r.text)
    assert res == {"events":[{"id": 0,
                'name': 'B & S Secret Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'The Center',
                'band_id': 0},
                {"id": 2,
                'name': 'Super Indie Time Day 2',
                'start': '17-03-15T19:00:00',
                'end': '17-03-15T22:00:00',
                'venue': 'Cabin Cabin',
                'band_id': 1},
                {"id": 3,
                'name': 'Surprise Show',
                'start': '16-03-15T19:00:00',
                'end': '16-03-15T22:00:00',
                'venue': 'Russian House',
                'band_id': 2}]}
