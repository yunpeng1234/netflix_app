const Pool = require('pg').Pool
const pool = new Pool({
  user: 'grab',
  host: 'localhost',
  database: 'data',
  password: 'grab',
  port: 5432,
})


const getAverageRuntime = (request, response) => {
  const startYear = request.query.startYear;
  const endYear = request.query.endYear;
  pool.query('SELECT release_year, avg(runtime) as average_runtime FROM titles WHERE release_year <= $1 and release_year >= $2 GROUP BY release_year', [endYear, startYear],(error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getSplit = (request, response) => {
  const year = request.query.year
  pool.query("SELECT release_year, SUM(CASE WHEN titles.release_year = $1 and titles.type = 'SHOW' THEN 1 ELSE 0 END) as show_count, SUM(CASE WHEN titles.release_year = $1 and titles.type = 'MOVIE' THEN 1 ELSE 0 END) as movie_count FROM titles where release_year = $1 GROUP BY release_year",[year],(error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

module.exports = {
  getSplit,
  getAverageRuntime,
}