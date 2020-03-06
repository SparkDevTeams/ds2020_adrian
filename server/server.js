import app from './app';
import connect_db from './database';
import "dotenv/config";
import {port} from "./env_setup";


async function start() {
    const db = await connect_db()
    app.listen({ port: port }, () => { 
        console.log("Server listening on port: " + port);
    });

    return true
}

start()