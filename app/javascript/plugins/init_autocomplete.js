import places from 'places.js';

// adding autocomplete to search form
const initAutocomplete = () => {
  const addressInput = document.getElementById('search');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
