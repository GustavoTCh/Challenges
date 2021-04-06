import mapboxgl from 'mapbox-gl';
import { useCallback, useEffect, useRef, useState } from 'react';
import { Subject } from 'rxjs';
import { v4 } from 'uuid';


mapboxgl.accessToken = 'pk.eyJ1IjoidGd1c3Rhdm9jaCIsImEiOiJja241aWtvYmowNGhsMnZzMWVkZzI1bzF1In0.qvcNSzmM84FA_sGfmiWrUw';


export const useMapbox = (initialPoint) => {

    // Ref to DIV of map
    const mapDiv = useRef()
    const setRef = useCallback(
        (node) => {
            mapDiv.current = node;
        },
        [],
    )
    // Ref to markers
    const markers = useRef({});

    // Observable of RxJS
    const movingMarker = useRef(new Subject());
    const newMarker = useRef(new Subject());
    

    // Map and coors
    const map = useRef();
    const [coords, setCoords] = useState(initialPoint);

    // function add markers
    const addMarker = useCallback((ev) => {
        const { lat, lng } = ev.lngLat;
        const marker = new mapboxgl.Marker();
        marker.id = v4();

        marker
            .setLngLat([lng, lat])
            .addTo(map.current)
            .setDraggable(true);

        markers.current[marker.id] = marker;

        newMarker.current.next(marker);

        marker.on('drag',({target})=>{
            const {id} = target;
            const {lng,lat} = target.getLngLat();
            movingMarker.current.next({
                id,
                lat,
                lng,
            });
        });
    }, [],);


    useEffect(() => {
        const mapBox = new mapboxgl.Map({
            container: mapDiv.current,
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [initialPoint.lng, initialPoint.lat],
            zoom: initialPoint.zoom
        });
        map.current = mapBox;
    }, [initialPoint]);

    //onMove map
    useEffect(() => {
        map.current?.on('move', () => {
            const { lng, lat } = map.current.getCenter();
            setCoords({
                lng: lng.toFixed(4),
                lat: lat.toFixed(4),
                zoom: map.current.getZoom().toFixed(2),
            });
        });
    }, []);

    // insert markers
    useEffect(() => {
        map.current?.on('click', addMarker);
    }, [addMarker]);


    return {
        addMarker,
        coords,
        markers,
        newMarker$: newMarker.current,
        movingMarker$: movingMarker.current,
        setRef
    }
}
