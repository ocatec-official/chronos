const express = require('express')
const app = express()
const stringifyObject = require('stringify-object');

app.set('port', process.env.PORT || 3000);

app.use(express.static('public'));

app.get('/api', (req, res) => res.send(stringifyObject(req.headers)));

app.listen(app.get('port'));
