
// Allows for a Graceful Shutdown. 
// Cleanup the DB Connections, etc here.
process.on('SIGINT', function() {
    console.log('Cleaning up the Application before Shutdown.....');
    process.exit(0);
});