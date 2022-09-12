module.exports = {
  plugins: {
    'postcss-import': {},
    'tailwindcss/nesting': 'postcss-nesting',
    'postcss-preset-env': { browsers: 'last 2 versions' },
    autoprefixer: {},
    tailwindcss: {},
  }
}
