import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Berlin", "London", "Paris", "New York", "Tokyo", "Toronto", "Barcelona", "Lisbon", "Mexico City", "Los Angeles", "Seoul", "Beijing"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
