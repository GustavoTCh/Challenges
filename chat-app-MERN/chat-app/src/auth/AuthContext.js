import React, { useContext } from 'react'
import { createContext, useCallback, useState } from "react";
import { ChatContext } from '../context/chat/ChatContext';

import { fetchWithoutToken, fetchWithToken } from "../helpers/fetch";
import { types } from '../types/types';

export const AuthContext = createContext();

const initialState = {
    uid: null,
    checking: true,
    logged: false,
    name: null,
    email: null
};


export const AuthProvider = ({ children }) => {

    const [auth, setAuth] = useState(initialState);
    const { dispatch } = useContext(ChatContext)

    const login = async (email, password) => {
        const resp = await fetchWithoutToken('login', { email, password }, 'POST');
        if (resp.ok) {
            localStorage.setItem('token', resp.token);
            const { user } = resp
            setAuth({
                uid: user.uid,
                checking: false,
                logged: true,
                name: user.name,
                email: user.email,
            });
        }

        return resp;
    }

    const register = async (name, email, password) => {
        const resp = await fetchWithoutToken('login/new', { name, email, password }, 'POST');
        if (resp.ok) {
            localStorage.setItem('token', resp.token);
            const { user } = resp
            setAuth({
                uid: user.uid,
                checking: false,
                logged: true,
                name: user.name,
                email: user.email,
            });
        }

        return resp;
    }

    const verifyToken = useCallback(async () => {
        const token = localStorage.getItem('token');

        if (!token) {
            return setAuth({
                checking: false,
                logged: false,
            });
        }

        const resp = await fetchWithToken('login/renew');
        if (resp.ok) {
            localStorage.setItem('token', resp.token);
            const { user } = resp;
            setAuth({
                uid: user.uid,
                checking: false,
                logged: true,
                name: user.name,
                email: user.email,
            });
            return resp;
        } else {
            setAuth({
                checking: false,
                logged: false,
            });
            return null;
        }
    }, [])

    const logout = () => {
        localStorage.removeItem('token');

        dispatch({ type: types.closeSession });
        setAuth({
            checking: false,
            logged: false,
        });
    }


    return (
        <AuthContext.Provider value={{
            auth,
            login,
            register,
            verifyToken,
            logout,
        }}>
            {children}
        </AuthContext.Provider>
    )
}
