import db from "../db/conn.mjs";
import asyncHandler from "../middlewares/asyncHandler.mjs";

export const findAll = asyncHandler(async (req, res) => {
  // Articles collection
  let articles = await db.collection("articles");

  let results = await articles.find({}).limit(50).toArray();

  res.status(200).json({
    data: results
  });
});
