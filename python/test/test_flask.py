from ..service import application
import json
import unittest

class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        self.app = application.test_client()

    def test_main_route(self):
        rv = self.app.get('/3')
        assert json.loads(rv.data)['result']==6
