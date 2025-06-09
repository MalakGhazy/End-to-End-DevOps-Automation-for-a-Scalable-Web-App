import {v4 as uuidv4} from "uuid";
// AWS SDK v3 imports
import { PutCommand, ScanCommand } from "@aws-sdk/lib-dynamodb";
import dynamoDbClient from "./dynamoClient.js";  // your v3 client export

const TABLE_NAME = process.env.EMPLOYEES_TABLE || "Employees";

export async function addEmployee(employee) {
  const params = {
    TableName: TABLE_NAME,
    Item:{
      id: uuidv4(),  // Generate a unique ID for the employee
      ...employee,  // Spread the employee data into the item
    }
  };

  try {
    await dynamoDbClient.send(new PutCommand(params));
    return params.Item;  // Return the newly added employee item
  } catch (error) {
    throw new Error(`Failed to add employee: ${error.message}`);
  }
}

export async function getEmployees() {
  const params = {
    TableName: TABLE_NAME,
  };

  try {
    const data = await dynamoDbClient.send(new ScanCommand(params));
    return data.Items;
  } catch (error) {
    throw new Error(`Failed to get employees: ${error.message}`);
  }
}
