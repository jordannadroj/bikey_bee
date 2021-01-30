import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/lenablank/ckkjnnz9o207u17nw2y586qem'
    });

    const marker = JSON.parse(mapElement.dataset.marker);

    const addMarkerToMap = (map, marker) => {

    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    };

    const fitMapToMarker = (map, marker) => {
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([ marker.lng, marker.lat ]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
    };

    addMarkerToMap(map, marker);
    fitMapToMarker(map, marker);
  }
};

export { initMapbox };
