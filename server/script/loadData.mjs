import { MongoClient } from "mongodb";
import fs from "fs/promises";

const uri = "mongodb+srv://viccast14:GeB1oxaYhOeuighM@victor-cluster.alr78qp.mongodb.net/?appName=victor-cluster";
const dbName = "NetForemost";
const collectionName = "articles";

async function insertData() {
  const client = new MongoClient(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true
  });

  try {
    await client.connect();

    const db = client.db(dbName);
    const collection = db.collection(collectionName);

    const dataBuffer = await fs.readFile("./data.json");
    const dataToInsert = JSON.parse(dataBuffer.toString());

    const result = await collection.insertMany(dataToInsert);
    console.log(`${result.insertedCount} documentos insertados`);
  } catch (error) {
    console.error("Error al conectar o insertar datos:", error);
  } finally {
    await client.close();
  }
}

insertData();
