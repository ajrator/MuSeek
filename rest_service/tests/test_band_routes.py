import requests
import json


SAMPLE_PAYLOADS = [
    {
        'data': {
            'type': 'Band',
            'attributes': {
                'name': 'Belle & Sebastian',
                'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/1/19/Belle_and_Sebastian_British_Band.jpeg'
            },
        }
    },
    {
        'data': {
            'type': 'Band',
            'attributes': {
                'name': 'Fleet Foxes',
                'imageUrl': 'https://pbs.twimg.com/profile_images/922123283/Fleet_Foxes.jpg'
            },
        }
    },
    {
        'data': {
            'type': 'Band',
            'attributes': {
                'name': 'Regina Spektor',
                'imageUrl': 'http://thekey.xpn.org/aatk/files/2012/05/spektorwwsftcs_slide.jpg'
            },
        }
    }
]


def test_api():
    """Check if the API is on.
    """
    r = requests.get('http://localhost:8000/clear')
    r = requests.get('http://localhost:8000')
    assert r.status_code==200

def test_band_post():
    """Check if adding bands works."""
    status_codes = []
    for payload in SAMPLE_PAYLOADS:
        r = requests.post('http://localhost:8000/bands', data=json.dumps(payload),
                headers={'Content-Type': 'application/json'} )
        status_codes.append(r.status_code)
    assert [status_code == 201 for status_code in status_codes]

def test_bands_get():
    """Check if getting all bands works."""
    r = requests.get('http://localhost:8000/bands')
    res = json.loads(r.text)
    assert res == {"bands":[{"id": 0,
                    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/1/19/Belle_and_Sebastian_British_Band.jpeg",
                    "name": "Belle & Sebastian"},
                    {"id": 1,
                     "imageUrl": "https://pbs.twimg.com/profile_images/922123283/Fleet_Foxes.jpg",
                     "name": "Fleet Foxes"},
                    {"id": 2,
                     "imageUrl": "http://thekey.xpn.org/aatk/files/2012/05/spektorwwsftcs_slide.jpg",
                     "name": "Regina Spektor"}]}

def test_band_get():
    """Check if getting one band works."""
    r = requests.get('http://localhost:8000/bands/1')
    res = json.loads(r.text)
    assert res == {"band": {"id": 1,
                     "imageUrl": "https://pbs.twimg.com/profile_images/922123283/Fleet_Foxes.jpg",
                     "name": "Fleet Foxes"}}

def test_band_delete():
    """Check if deleting one band works."""
    r = requests.delete('http://localhost:8000/bands/1')
    res = json.loads(r.text)
    print res
    assert res == {"bands":[{"id": 0,
                    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/1/19/Belle_and_Sebastian_British_Band.jpeg",
                    "name": "Belle & Sebastian"},
                    {"id": 2,
                     "imageUrl": "http://thekey.xpn.org/aatk/files/2012/05/spektorwwsftcs_slide.jpg",
                     "name": "Regina Spektor"}]}
