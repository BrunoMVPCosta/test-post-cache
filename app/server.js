const express = require('express')

const PORT = 8080;
const HOST = '0.0.0.0';

const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.get('/', (req, res) => {
    res.setHeader('Cache-Control', 'no-cache')
    res.send('Hello world\n');
});

app.post('/search', (req, res) => {
    res.setHeader('Cache-Control', 'public, max-age=60')
    res.json(req.body);
});

app.post('/search/no/cache', (req, res) => {
    res.setHeader('Cache-Control', 'no-cache')
    res.json(req.body);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
