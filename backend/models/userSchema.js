const mongoose = require('mongoose');

const User = new mongoose.Schema({
  storename: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  ownername: { type: String, required: true },
  empnum: { type: String, required: true },
  GSTnum: { type: String, required: true },
  storelocation: { type: String, required: true },
});

module.exports = mongoose.model('storedetail', User);