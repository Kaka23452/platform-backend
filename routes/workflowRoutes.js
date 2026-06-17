const express = require("express");
const axios = require("axios");

const router = express.Router();

router.post("/trigger", async (req, res) => {
  try {
    const response = await axios.post(
      "https://n8n-tefadow920-dev.apps.rm2.thpm.p1.openshiftapps.com/webhook/test-flow",
      req.body
    );

    res.json({
      success: true,
      data: response.data,
    });

  } catch (err) {
    res.status(500).json({
      success: false,
      error: err.message,
    });
  }
});

module.exports = router;
