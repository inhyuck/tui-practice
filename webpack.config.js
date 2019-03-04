const path = require('path');

module.exports = {
    entry: './src/main/resources/static/new.js',
    output: {
        path: path.resolve(__dirname, 'src/main/resources/static/dist'),
        filename: 'newBundle.js'
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ['style-loader', 'css-loader']
                },
            {
                test: /\.(gif|png|jpe?g|svg)$/i,
                use: {
                    loader: 'file-loader',
                    options: {
                        name: '[name].[ext]?[hash]',
                        publicPath: '../dist'
                    }
                }
            }
        ]
    }

};