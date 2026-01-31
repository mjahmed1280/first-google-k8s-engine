import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    """Test the home route returns the expected JSON."""
    response = client.get('/')
    assert response.status_code == 200
    expected_json = {"message": "Hello from Flask on Kubernetes!"}
    assert response.get_json() == expected_json
