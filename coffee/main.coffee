React = require "react"
ReactDOM = require "react-dom"
axios = require "axios"
_ = require "underscore"

{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

HomeView = require "./views/HomeView.coffee"
InputView = require "./views/InputView.coffee"


Tag = require "antd/lib/tag"
Table = require "antd/lib/table"
Layout = require "antd/lib/layout"
{Header, Sider, Content, Footer} = Layout


class Main extends React.Component
    constructor:->
        super arguments...
        @state = {
           
        }

    render:->
        h = window.innerHeight
        React.createElement BrowserRouter, {},
            React.createElement Layout, {},

                React.createElement Content, {
                    style:{
                            padding: "0 50px"
                            marginTop: 84
                            height: h-148+"px" 
                            overflowY: "auto"
                        }
                    },
                    React.createElement Switch, {},
                        React.createElement Route, {path:"/input", component:InputView}
                        React.createElement Route, {path:"/", component:HomeView}

                React.createElement Footer, {
                     className:"footer-box"
                }
                
                React.createElement Header, {
                    className: "header-box"
                },
                    React.createElement Link, {to:"/"}, "списък    "
                    React.createElement Link, {to:"/input"}, "добави "

window.onload = ->
    ReactDOM.render React.createElement(Main), document.getElementById("root")