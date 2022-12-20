const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      colors: {
        'twitter': {
          DEFAULT: '#1da1f2',
          hover: '#0d94e7',
          active: '#0d8bd9'
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
