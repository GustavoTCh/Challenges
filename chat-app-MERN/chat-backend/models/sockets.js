const { verifyJWT } = require("../helpers/jwt");
const { userConnected, userDisconnected, getUsers, saveMessage } = require("../controllers/socket");


class Sockets {

    constructor(io) {

        this.io = io;

        this.socketEvents();
    }

    socketEvents() {
        // On connection
        this.io.on('connection', async (socket) => {
            const [isValidate, uid] = verifyJWT(socket.handshake.query['x-token']);
            if (!isValidate) {
                console.log("Socket unknow");
                return socket.disconnect();
            }

            await userConnected(uid);

            // Join a user a Sala
            socket.join(uid);

            // TODO validate the JWT
            // if toke is invalid, desconnecting

            // TODO varify the user active from UID

            // TODO Emit all user connected
            this.io.emit('list-users', await getUsers());

            // TODO Socket join, uid

            // Listing when client sent a message
            socket.on('message-private', async (payload) => {
                const message = await saveMessage(payload);
                this.io.to(payload.to).emit('message-private', message);
            });
            // message-personal

            // TODO disconnect

            // TODO emit all users connectes

            socket.on('disconnect', async () => {
                await userDisconnected(uid);
                this.io.emit('list-users', await getUsers());
            });
        });
    }


}


module.exports = Sockets;