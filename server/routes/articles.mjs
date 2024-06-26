import express from "express";
import { findAll } from "../controllers/articles.controller.mjs";

const router = express.Router();

router.get("/", findAll);

export default router;
