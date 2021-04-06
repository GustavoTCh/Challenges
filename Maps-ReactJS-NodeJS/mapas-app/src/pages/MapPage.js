import React, { useEffect } from 'react';
import { useMapbox } from '../hooks/useMapbox';


const initialPoint = {
    lat: -17.3895,
    lng: -66.1568,
    zoom: 13
}

export const MapPage = () => {
    const {coords,setRef,newMarker$,movingMarker$}  = useMapbox(initialPoint);

    useEffect(() => {
        newMarker$.subscribe((marker)=>{
        });
    }, [newMarker$])

    useEffect(() => {
        movingMarker$.subscribe((marker)=>{
        });
    }, [movingMarker$])

    return (
        <>
            <div className="info">
                Lng: { coords.lng} | lat {coords.lat} | zoom: {coords.zoom}
            </div>
            <div
                ref={setRef}
                className="mapContainer"
            />
        </>
    )
}
