import React, { useContext, useEffect, createContext } from 'react';
import { AuthContext } from '../auth/AuthContext';
import { ChatContext } from './chat/ChatContext';
import { useSocket } from '../hooks/useSocket'
import { types } from '../types/types';
import { scrollToBottomAnimated } from '../helpers/scrollToBottom';

export const SocketContext = createContext();


export const SocketProvider = ({ children }) => {

    const { socket, online, connectSocket, disconnectSocket } = useSocket('http://localhost:8080');
    const { auth } = useContext(AuthContext);
    const { dispatch } = useContext(ChatContext);

    useEffect(() => {
        if (auth.logged) {
            connectSocket();
        }
    }, [auth, connectSocket]);

    useEffect(() => {
        if (!auth.logged) {
            disconnectSocket();
        }
    }, [auth, disconnectSocket]);

    // Listing users connected
    useEffect(() => {
        socket?.on('list-users', (users) => {
            dispatch({
                type: types.usersLoaded,
                payload: users,
            });
        });
    }, [socket, dispatch]);

    useEffect(() => {
        socket?.on('message-private', (message) => {
            dispatch({
                type: types.newMessage,
                payload: message,
            });

            scrollToBottomAnimated('messages');
        });
    }, [socket, dispatch]);

    return (
        <SocketContext.Provider value={{ socket, online }}>
            {children}
        </SocketContext.Provider>
    )
}