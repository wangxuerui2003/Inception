// app.js
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello! this is a nodejs app!');
});

const server = app.listen(port, '0.0.0.0', () => {
  console.log(`Server is running at http://localhost:${port}`);
});

process.on('SIGTERM', () => {
  console.log('Received SIGTERM signal. Closing server gracefully...');
  server.close(() => {
    console.log('Server closed. Exiting process...');
    process.exit(0);
  });
});