import config from './../config/config'
import app from './express'
import mongoose from 'mongoose'
//import bidding from './controllers/bidding.controller'

// Connection URL
mongoose.Promise = global.Promise
mongoose.connect(config.mongoUri, { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true, useFindAndModify: true })
mongoose.connection.on('error', () => {
  throw new Error(`unable to connect to database: ${config.mongoUri}`)
})





//mongoose.connect("mongodb://kkmouf:123456@mongo:27017/?authSource=admin"
//).then(() => console.log("Successful")).catch((e) => console.log(e));
//const server = app.listen(config.port, (err) => {
  app.listen(config.port, (err) => {
  if (err) {
    console.log(err)
  }
  console.info('Server started on port %s.', config.port)
})

//bidding(server)
