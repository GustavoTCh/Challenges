import React, { useContext, useEffect } from 'react';
import { SocketContext } from '../context/SocketContext';
import { useMapbox } from '../hooks/useMapbox';


const initialPoint = {
    lat: -17.3895,
    lng: -66.1568,
    zoom: 13
}

export const MapPage = () => {
    const { coords, setRef, newMarker$, movingMarker$, addMarker, updateMarker } = useMapbox(initialPoint);
    const { socket } = useContext(SocketContext);

    // listening markers
    useEffect(() => {
        socket.on('markers-actives', (markers) => {
            for (const key of Object.keys(markers)) {
                addMarker(markers[key],key);
            }
        });
    }, [socket,addMarker]);

    // new marker
    useEffect(() => {
        newMarker$.subscribe((marker) => {
            socket.emit('marker-new', marker);
        });
    }, [newMarker$, socket]);

    // moving marker
    useEffect(() => {
        movingMarker$.subscribe((marker) => {
            socket.emit('marker-updated',marker);
        });
    }, [socket,movingMarker$]);

    // listening moving marker
    useEffect(() => {
        socket.on('marker-updated', (marker) => {
            updateMarker(marker);
        });
    }, [socket,updateMarker]);

    // listening new markers
    useEffect(() => {
        socket.on('marker-new', (marker) => {
            addMarker(marker,marker.id);
        });
    }, [socket,addMarker]);

    return (
        <>
            <div className="info">
                Lng: {coords.lng} | lat {coords.lat} | zoom: {coords.zoom}
            </div>
            <div
                ref={setRef}
                className="mapContainer"
            />
        </>
    )
}
