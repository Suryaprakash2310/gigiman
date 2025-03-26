const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/userSchema');
const router = express.Router();

// Register User
router.post('/register', async (req, res) => {
  try {
    const { storename, email, password, ownername, empnum, GSTnum, storelocation } = req.body;
    console.log(req.body);
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ storename, email, password: hashedPassword, ownername, empnum, GSTnum, storelocation });
    await newUser.save();
    res.status(201).json({ message: 'User registered successfully!' });
  } catch (error) {
    res.status(400).json({ message: 'Error registering user', error });
  }
});

// Login User
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email });
  if (!user || !(await bcrypt.compare(password, user.password))) {
    return res.status(401).json({ message: 'Invalid email or password' });
  }
  res.status(200).json({ message: 'Login successful', user });
});

module.exports = router;