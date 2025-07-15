const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 3000;

mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => console.log("MongoDB connected"))
.catch(err => console.error("MongoDB connection error:", err));

app.get("/", (req, res) => {
  res.send("DevSecOps app is running securely!");
});

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
