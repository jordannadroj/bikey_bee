import flatpickr from "flatpickr";

// the window.add... allows for the flatpickr to be loaded straight away. Before there was a bug that did not load the flatpickr unless the page was reloaded
window.addEventListener("turbolinks:load", function() {
  flatpickr(".datepicker", {});
});

// export { flatpickr };
