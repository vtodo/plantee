React = require "react"
ReactDOM = require "react-dom"

# Chart = require "react-chartjs"


polardata = [
    {
        value: 120,
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Red"
    },
    {
        value: 50,
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Green"
    },
    {
        value: 100,
        color: "#FDB45C",
        highlight: "#FFC870",
        label: "Yellow"
    },
    {
        value: 40,
        color: "#949FB1",
        highlight: "#A8B3C5",
        label: "Grey"
    },
    {
        value: 120,
        color: "#4D5360",
        highlight: "#616774",
        label: "Dark Grey"
    }

]

class StatView extends React.Component
    render:->
        
        # React.createElement Chart.PolarArea, {data:polardata, width:400, height:300}

module.exports = StatView





















randColor = =>
    "rgba(#{ parseInt(Math.random()*255) },#{ parseInt(Math.random()*255) },#{ parseInt(Math.random()*255) },#{ Math.random() })"


data = {
    labels: ["Прилагателни", "Съществителни", "Глаголи"],
    datasets: [
        
        {
            label: 'в жанра',
            data: [12, 3, 11],
            fillColor: [
                randColor()
                randColor()
                randColor()
            ],
            strokeColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
            ]
            highlightFill: randColor()
            highlightStroke: randColor()
        }
    ]
}