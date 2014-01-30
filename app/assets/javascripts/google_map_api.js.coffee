$ ->
  if $('#google').length
    input = document.getElementById('google')
    autocomplete = new google.maps.places.Autocomplete input,
      types: ['(cities)']
