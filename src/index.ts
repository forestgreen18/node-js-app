// src/index.js
import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 3000;

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

app.get("/hello-world", (req: Request, res: Response) => {
  res.send("Hello, World!");
});

app.get("/current-time", (req: Request, res: Response) => {
  const currentTime = new Date().toISOString();
  res.send(`Current time: ${currentTime}`);
});

app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
