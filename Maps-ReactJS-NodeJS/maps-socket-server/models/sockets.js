const Markers = require('./markers');

class Sockets {

    constructor( io ) {

        this.io = io;

        this.markers = new Markers();

        this.socketEvents();
    }

    socketEvents() {
        // On connection
        this.io.on('connection', ( socket ) => {
            socket.emit('markers-actives',this.markers.actives);

            socket.on('marker-new',(marker)=>{
                this.markers.addMarker(marker);
                socket.broadcast.emit('marker-new',marker);
            });

            socket.on('marker-updated',(marker)=>{
                this.markers.updateMarker(marker);
                socket.broadcast.emit('marker-updated',marker);
            });

        });
    }


}


module.exports = Sockets;