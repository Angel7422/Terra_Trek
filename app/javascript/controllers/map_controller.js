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
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
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
