const User = require("../models/userSchema");
const bcrypt = require("bcrypt");
const errormsg = require("../utilization/404.js");

const register = async (req, res, next) => {
  try {
    const {
      storename,
      email,
      password,
      ownername,
      empnum,
      GSTnum,
      storelocation,
    } = req.body;
    if (
      !storename ||
      !email ||
      !password ||
      !ownername ||
      !empnum ||
      !GSTnum ||
      !storelocation ||
      storename === "" ||
      email === "" ||
      password === "" ||
      ownername === "" ||
      empnum === "" ||
      GSTnum === "" ||
      storelocation === ""
    ) {
      next(errormsg(400, "All fields are required"));
    }
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      next(errormsg(400, "Email is already"));
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({
      storename,
      email,
      password: hashedPassword,
      ownername,
      empnum: empnum.toString(),
      GSTnum: GSTnum.toString(),
      storelocation,
    });

    await newUser.save();

    res.status(201).json({ message: "User registered successfully!" });
  } catch (error) {
    console.error("Registration error:", error);
    next(errormsg(400, "serer issue"));
  }
};
const login = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    if (!email || !password || email === "" || password === "") {
      next(erromsg(400, "Email and password required"));
    }
    const user = await User.findOne({ email });
    if (!user || !(await bcrypt.compare(password, user.password))) {
      next(erromsg(400, "Invaild email and password"));
    }
    const { password: _, ...userData } = user._doc;
    res.status(200).json({ message: "Login successful", user: userData });
  } catch (error) {
    console.error("Login error:", error);
    next(errormsg(500, "server error"));
  }
};
module.exports = { register, login };
