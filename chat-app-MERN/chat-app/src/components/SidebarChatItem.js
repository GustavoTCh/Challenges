import React, { useContext } from 'react'
import { ChatContext } from '../context/chat/ChatContext';
import { fetchWithToken } from '../helpers/fetch';
import { scrollToBottomSimple } from '../helpers/scrollToBottom';
import { types } from '../types/types';

export const SidebarChatItem = ({ user }) => {

    const { chatState, dispatch } = useContext(ChatContext);


    const onClick = async () => {
        dispatch({
            type: types.activeChat,
            payload: user.uid,
        });

        const resp = await fetchWithToken(`messages/${user.uid}`);
        dispatch({
            type: types.loadMessages,
            payload: resp.messages
        });

        scrollToBottomSimple('messages');
    }

    return (
        < div
            className={`chat_list ${(user.uid === chatState.chatActive) && 'active_chat'}`}
            onClick={onClick}
        >

            <div className="chat_people">
                <div className="chat_img">
                    <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" />
                </div>
                <div className="chat_ib">
                    <h5>{user.name}</h5>
                    {
                        (user.online)
                            ? <span className="text-success">Online</span>
                            : <span className="text-danger">Offline</span>
                    }
                </div>
            </div>
        </div >
    )
}
