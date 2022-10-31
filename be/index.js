const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 8000
const db = require('./queries')

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
    response.json({ info: 'Node.js, Express, and Postgres API' })
})


app.get('/runtime', db.getAverageRuntime)
app.get('/split', db.getSplit)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
  })
