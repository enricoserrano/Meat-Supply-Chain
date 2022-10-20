var connect = require('connect');
var serveStatic = require('serve-static');
const express = require('express');
const app = express();

app.use("/images", express.static('images'));
//address http://localhost:8080/index.html
//address images http://localhost:8080/images/registericon.png
connect()
    .use(serveStatic(__dirname))
    .listen(8080, () => console.log('Server running on 8080...'));

