import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      // center: this.#getCenterOfMarkers(),
      zoom: 20
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Géolocalisation
    this.geolocateButton = document.getElementById('geolocate-button')
    this.geolocateButton.addEventListener('click', () => this.geolocate())
  }

  geolocate() {
    if ('geolocation' in navigator) {
      navigator.geolocation.getCurrentPosition((position) => {
        const { latitude, longitude } = position.coords
        this.map.flyTo({ center: [longitude, latitude], zoom: 14 })

        new mapboxgl.Marker()
          .setLngLat([longitude, latitude])
          .addTo(this.map)

        // Basculer les icônes
        document.getElementById('geolocate-icon-off').style.display = 'none'
        document.getElementById('geolocate-icon-on').style.display = 'inline'
      })
    } else {
      alert('Géolocalisation non supportée par votre navigateur.')
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Créez un élément HTML pour le marker
      const el = document.createElement('div')
      el.className = 'custom-marker'
      el.style.backgroundImage = 'url(https://png.pngtree.com/png-clipart/20221022/original/pngtree-orange-pin-map-png-image_8711935.png)'
      el.style.width = '70px'
      el.style.height = '70px'
      el.style.backgroundSize = '100%'

      // Créez le popup avec une photo
      const popup = new mapboxgl.Popup().setHTML(`
        <div class="pin-location">
          <h1>${marker.name}</h1>
          <img src="${marker.imageUrl}" style="width: 100%">
          <button onclick="window.location.href = '/activities/${marker.id}'">Réserver</button>
        </div>
      `)


      // Ajoutez le marker à la carte
      new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 20, duration: 0 })
  }


  // #getCenterOfMarkers() {
  //   if (this.markersValue.length === 0) {
  //     return [0, 0]
  //   }

  //   const lngSum = this.markersValue.reduce((sum, marker) => sum + marker.lng, 0)
  //   const latSum = this.markersValue.reduce((sum, marker) => sum + marker.lat, 0)
  //   return [lngSum / this.markersValue.length, latSum / this.markersValue.length]
  // }
}
