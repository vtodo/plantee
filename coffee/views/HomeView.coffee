React = require "react"
ReactDOM = require "react-dom"
{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

Row = require("antd/lib/row")
Col = require("antd/lib/col")
Card = require("antd/lib/card")

class HomeView extends React.Component
    
    render:->
        React.createElement Row, {gutter:16},
            React.createElement Col, {md:8, xs:24},
                React.createElement Card, {
                    className:"home-card"                    
                    title:"Най търсени автори"
                },  
                    for i in [0..9]
                        React.DOM.li {key:i},
                            React.createElement Link, {to:"/"+i},
                                i + " име на нещо"
                
            React.createElement Col, {md:8, xs:24},
                React.createElement Card, {
                    className:"home-card"
                    title:"Най търсени книги"
                },
                    for i in [0..9]
                        React.DOM.li {key:i},
                            React.createElement Link, {to:"/"+i},
                                i + " име на нещо"

            React.createElement Col, {md:8, xs:24},
                React.createElement Card, {
                    className:"home-card"
                    title:"Най търсени думи"
                }, 
                    for i in [0..9]
                        React.DOM.li {key:i},
                            React.createElement Link, {to:"/"+i},
                                i + " име на нещо"

module.exports = HomeView