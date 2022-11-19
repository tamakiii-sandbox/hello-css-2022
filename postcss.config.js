module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-preset-env'),
    require('stylelint'),
    require('autoprefixer'),
    require('cssnano'),
  ]
}
