import express from 'express';
import {addEmployeeController,getEmployeesController} from '../controllers/employeesController.js';

const router = express.Router();

router.get('/', getEmployeesController);
router.post('/', addEmployeeController);

export default router;
