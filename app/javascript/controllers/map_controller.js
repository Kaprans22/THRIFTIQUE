// Import the Mapbox library
import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

const pickupPoints = [
  {lat: 52.35711193960369, lng:4.795818087850438, address: "217 TUSSEN MEER, 1069, AMSTERDAM"},
  {lat:52.37917502432261, lng:4.834187412984473, address: "29-31 BURGEMEESTER DE VLUGTLAAN, 1063, AMSTERDAM"},
  {lat:52.36734228800984, lng:4.872701599491671, address: "59H KINKERSTRAAT, 1053, AMSTERDAM"},
  {lat:52.37831406697159, lng:4.881532455312572, address: "WESTERSTRAAT 196, 1015, AMSTERDAM"},
  {lat:52.355945825839974, lng:4.850600455311518, address: "71 HAARLEMMERMEERSTRAAT, 1058, AMSTERDAM"},
  {lat:52.39045843800483, lng:4.8784142688053365, address: "SPAARNDAMMERSTRAAT 107, 1013, AMSTERDAM"},
  {lat:52.357157807138044, lng:4.795667884147488, address: "217 TUSSEN MEER, 1069, AMSTERDAM"},
]

// ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????

const jsonPickupPoints = JSON.stringify(pickupPoints);
const filePath = 'public/pickupPoints.json';

fs.writeFileSync(filePath, jsonPickupPoints, 'utf-8');
fs.writeFileSync(filePath, 'Test string', 'utf-8');

const fs = require('fs');

fs.writeFile(filePath, jsonPickupPoints, 'utf-8', function(err) {
  if (err) {
    console.error('Error writing file:', err);
  } else {
    console.log('File written successfully');
  }
});

//ITS FUCKING LATE AND THIS BITCH AINT WORKING


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

  }
}
