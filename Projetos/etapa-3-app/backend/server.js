const express = require("express");

const app = express();
const port = 3000;

app.get("/health", (request, response) => {
    response.json({
        status: "ok",
        service: "backend"
    });
});

app.get("/api/message", (request, response) => {
    response.json({
        message: "Backend executando na AWS EC2!",
        timestamp: new Date().toISOString()
    });
});

app.listen(port, "0.0.0.0", () => {
    console.log(`Backend executando na porta ${port}`);
});