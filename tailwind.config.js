/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './app/views/**/*',
    './app/components/**/*',
    './test/components/previews/**/*'
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
