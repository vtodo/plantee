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
           items:[]
           edited:null
        }

    componentWillMount:->
        @retrieveItems()  


    retrieveItems:->
        axios.get('/dumps').then((response)=>
            @setState({items:response.data})
        ).catch((err)=>return)

    render:->
        React.createElement BrowserRouter, {},
            React.createElement Layout, {},
                React.createElement Content, { className:"content-box"},
                    React.createElement Switch, {},
                        React.createElement Route, {path:"/input", render:=>React.createElement InputView, {
                            edited:@state.edited
                        }}

                        React.createElement Route, {path:"/", render:=>React.createElement HomeView, {
                            items:@state.items
                            setEdited:(i)=>
                                @setState({edited:@state.items[i]})
                        }}
                
                React.createElement Header, {
                    className: "header-box"
                },
                    
                    React.createElement Link, {to:"/", style:{width:"20%"}, onClick:=>@retrieveItems()},
                        React.createElement "div", {style:{width:"100%",height:"100%", backgroundColor:"green"}},
                            "списък"
                    React.createElement Link, {to:"/input", style:{width:"20%"}, onClick:=>@setState({edited:null})}, 
                        React.createElement "div", {style:{width:"100%",height:"100%", backgroundColor:"purple"}},
                            "добави"
                        
                
                React.createElement Footer, {
                     className:"footer-box"
                },
                    React.createElement "div", {style:{width:"100%"}},
                        "растения в базата: " + @state.items?.length
                
window.onload = ->
    ReactDOM.render React.createElement(Main), document.getElementById("root")