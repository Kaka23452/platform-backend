const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.json({
    status: "ok",
    message: "Platform Backend Running"
  });
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  console.log(`Server running on ${PORT}`);
});
