import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Get Drunk", "One cocktail at a time", "Hello"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
