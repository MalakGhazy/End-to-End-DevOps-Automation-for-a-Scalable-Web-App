import { addEmployee, getEmployees } from '../services/dynamoService.js';

// Controller to get all employees
export const getEmployeesController = async (req, res) => {
  try {
    const employees = await getEmployees();
    res.status(200).json(employees);
    
  } catch (error) {
    console.error('Error fetching employees ', error);
    res.status(500).json({ message: 'Failed to fetch employees' });
  }
};

// Controller to add a new employee
export const addEmployeeController = async (req, res) => {
  try {
    const employeeData = req.body;
    if (!employeeData.name || !employeeData.role) {
      return res.status(400).json({ message: 'Name and role are required' });
    }

    const newEmployee = await addEmployee(employeeData);
    res.status(201).json(newEmployee);
  } catch (error) {
    console.error('Error adding employee', error);
    res.status(500).json({ message: 'Failed to add employee' });
  }
};