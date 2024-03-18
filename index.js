import express from 'express';
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient();

const app = express();
app.use(express.json());


app.get('/api/ticker/', async (req, res) => {

    const { ticker, column, period } = req.query;
    const columns = column.split(',')

    // Validate input parameters
    if (!ticker || !column || !period || isNaN(parseInt(period))) {
        return res.status(400).json({ error: 'Invalid input parameters' });
    }
    // Ensure the requested column is valid
    const validColumns = ['revenue', 'gp', 'fcf', 'capex'];
    columns.map((col) => {
        if (!validColumns.includes(col)) {
            return res.status(400).json({ error: 'Invalid column name' });
        }
    })

    // Assuming column and period are provided properly
    try {

        // get the date 
        const fromDate = new Date();
        fromDate.setFullYear(fromDate.getFullYear() - parseInt(period));

        const companyData = await prisma.data.findMany(
            {
                where: {
                    ticker,
                    date: {
                        gte: fromDate,
                    },

                },
                select: Object.fromEntries(columns.map(column => [column, true])),
                orderBy: {
                    date: 'asc',
                },
            }
        )

        return res.json(companyData);
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


app.listen(8000, () => {
    console.log(`Server started on port 8000`);
});