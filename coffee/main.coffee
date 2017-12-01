React = require "react"
ReactDOM = require "react-dom"
axios = require "axios"
_ = require "underscore"

{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"


StatView = require "./views/StatView.coffee"
HomeView = require "./views/HomeView.coffee"
TasksView = require "./views/TasksView.coffee"

Tag = require "antd/lib/tag"
Table = require "antd/lib/table"
Layout = require "antd/lib/layout"
{Header, Sider, Content, Footer} = Layout


class Main extends React.Component
    constructor:->
        super arguments...
      
        @state = {
            criteria : {
                nodes:[]
                edges:[]
            }
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
                        React.createElement Route, {path:"/temp", component:TasksView}
                        
                        React.createElement Route, {path:"/", component:HomeView}

                React.createElement Footer, {
                     style:{ 
                        position: 'fixed'
                        width: '100%'
                        backgroundColor:"red"
                        bottom:0
                    }
                }
                
                React.createElement Header, {
                    className: "header-box"
                },
                    React.createElement Link, {to:"/"}, "home "
                    React.createElement Link, {to:"/temp"}, "temp "

window.onload = ->
    ReactDOM.render React.createElement(Main), document.getElementById("root")