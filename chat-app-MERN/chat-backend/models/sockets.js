

class Sockets {

    constructor( io ) {

        this.io = io;

        this.socketEvents();
    }

    socketEvents() {
        // On connection
        this.io.on('connection', ( socket ) => {
            // TODO validate the JWT
            // if toke is invalid, desconnecting

            // TODO varify the user active from UID

            // TODO Emit all user connected

            // TODO Socket join, uid

            // Listing when client sent a message
            // message-personal

            // TODO disconnect

            // TODO emit all users connectes
        });
    }


}


module.exports = Sockets;