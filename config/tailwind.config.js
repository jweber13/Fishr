/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
  ],
  theme: {
    extend: {
      colors: {
        dark: "#151D20",
        light: "#FBFBFB",
        primary: "#08D4FD",
      },
      fontFamily: {
        sans: ["Inter", "sans-serif"],
      },
    },
    plugins: [
      require("@tailwindcss/typography"),
      require("@tailwindcss/forms"),
      require("@tailwindcss/aspect-ratio"),
    ],
  };
