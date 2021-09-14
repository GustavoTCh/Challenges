import { animateScroll } from "react-scroll";


export const scrollToBottomSimple = (id) => {
    animateScroll.scrollToBottom({
        containerId: id,
        duration: 0
    });
}

export const scrollToBottomAnimated = (id) => {
    animateScroll.scrollToBottom({
        containerId: id,
        duration: 250
    });
}