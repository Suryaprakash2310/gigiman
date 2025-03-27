const express = require('express');
const mongoose = require('mongoose');
const userRoutes = require('./routes/userRoutes');


const app = express();
const PORT = 5000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/server/users', userRoutes);

// MongoDB Connection
mongoose
  .connect(process.env.MONGO_URL)
  .then(() => console.log(" Connected to MongoDB"))
  .catch((err) => console.error("MongoDB connection error:", err));
// Basic Route
app.get('/', (req, res) => {
  res.send('Backend is running!');
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});