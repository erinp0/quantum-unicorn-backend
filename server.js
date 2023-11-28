const express = require('express');
const sql = require('mssql');
const app = express();

// Configuration for connecting to Azure SQL Database
const config = {
    user: 'quantumunicorns',
    password: 'reboot2023!',
    server: 'quantumunicorns.database.windows.net',
    database: 'available_beds',
    options: {
        encrypt: true, // For Azure SQL
        trustServerCertificate: false // Change to true for local dev / self-signed certs
    }
};

app.get('/number_beds_realtime', async (req, res) => {
    try {
        console.log(1);
        // Connect to the database
        await sql.connect(config);

        // Execute the SQL query
        const result = await sql.query(`SELECT 
            date, 
            SUM(available) AS TotalAvailable, 
            SUM(emergency) AS TotalEmergency 
        FROM 
            HostAvailability 
        GROUP BY 
        date`);
        console.log(2);
        // Send the query result as JSON response
        res.json(result.recordset.map((record)=> {
            return {
                available: record.TotalAvailable,
                emergency: record.TotalEmergency,
            }
        }));
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error fetching data from the database.');
    } finally {
        // Close the SQL connection
        sql.close();
    }
});

const PORT = process.env.PORT || 3000; // Set your desired port number
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
