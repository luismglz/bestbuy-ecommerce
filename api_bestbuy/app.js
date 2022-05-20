const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');





const PORT = process.env.PORT || 3030;

const app = express();


app.use(bodyParser.json());

let connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'hola123',
  database: 'bestbuy'
});

//get all products
app.get('/products', (req, res)=>{

  const getAllQUERY = "SELECT * FROM products";

  connection.query(getAllQuery, (err, results)=>{
    if(err) throw err
    if (results.length > 0){
      res.json(results);
    }else{
      res.send('No results')
    }
  })

})

//get by title
app.get('/products/:title', (req, res) => {
  const {title} = req.params
  const getByTitleQUERY = `SELECT * FROM products WHERE title LIKE '${title}%'`


  connection.query(getByTitleQUERY, (err, result)=>{
    if(err) throw error;

    if(result.length > 0){
      res.json(result);
    }else{
      res.send('No result')
    }
  })

})

//create product
app.post('/products/new',(req, res)=>{

})


app.put('/products/get/:id', (req, res)=>{

})

app.delete('/products/del/:id', (req, res)=>{

})


connection.connect(error =>{
  if(error) throw error;
  console.log('Database server running')
});

app.listen(PORT, ()=>{console.log(`Server running on port ${PORT}`)});


