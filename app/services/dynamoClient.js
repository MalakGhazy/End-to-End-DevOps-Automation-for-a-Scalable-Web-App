import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import dotenv from "dotenv";
dotenv.config();

const client = new DynamoDBClient({ region: process.env.AWS_REGION || "us-east-1" });
const dynamoDbClient = DynamoDBDocumentClient.from(client);

export default dynamoDbClient;