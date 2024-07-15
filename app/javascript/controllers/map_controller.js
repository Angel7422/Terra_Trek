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

    this.markers = [] // Initialiser les marqueurs avant de les ajouter

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    // Géolocalisation
    this.geolocateButton = document.getElementById('geolocate-button')
    this.geolocateButton.addEventListener('click', () => this.geolocate())

    // Ajouter des événements aux boutons "Voir sur la carte"
    this.#addViewMapEventListeners()
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
      el.style.backgroundImage = 'url("https://png.pngtree.com/png-clipart/20221022/original/pngtree-orange-pin-map-png-image_8711935.png")'
      el.style.width = '70px'
      el.style.height = '70px'
      el.style.backgroundSize = '100%'

      let popupContent = `<div class="pin-location">`
      if (marker.name) {
        popupContent += `<h1>${marker.name}</h1>`
      }
      if (marker.imageUrl) {
        popupContent += `<img src="${marker.imageUrl}" style="width: 100%">`
      }
      if (marker.id) {
        popupContent += `<button onclick="window.location.href = '/activities/${marker.id}'">Réserver</button>`
      }
      popupContent += `</div>`

      const popup = new mapboxgl.Popup().setHTML(popupContent)

      // Ajoutez le marker à la carte
      const mapMarker = new mapboxgl.Marker(el)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

      // Stocker le marqueur avec son ID pour référence ultérieure
      this.markers.push({ id: marker.id, marker: mapMarker })
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 20, duration: 0 })
  }

  #addViewMapEventListeners() {
    document.querySelectorAll('.btn-view-map').forEach(button => {
      button.addEventListener('click', (event) => {
        const userId = parseInt(event.currentTarget.getAttribute('data-id'), 10)
        const userMarkerObj = this.markers.find(m => m.id === userId)

        if (userMarkerObj) {
          const userMarker = userMarkerObj.marker
          this.map.flyTo({
            center: userMarker.getLngLat(),
            zoom: 14
          })
          userMarker.togglePopup()
        }
      })
    })
  }
}

// #getCenterOfMarkers() {
//   if (this.markersValue.length === 0) {
//     return [0, 0]
//   }

//   const lngSum = this.markersValue.reduce((sum, marker) => sum + marker.lng, 0)
//   const latSum = this.markersValue.reduce((sum, marker) => sum + marker.lat, 0)
//   return [lngSum / this.markersValue.length, latSum / this.markersValue.length]
// }
