import "dotenv/config";

let db_url;
let port;

// Setup environment
console.log("Starting config");
db_url = process.env.DB_URL || 'mongodb://localhost:27017/fortunate_dev_db"'
port = process.env.PORT || 8080

console.log("Environment: " + process.env.NODE_ENV);
console.log("DB URL: " + db_url);

export {db_url, port};