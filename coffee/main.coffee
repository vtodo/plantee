React = require "react"
ReactDOM = require "react-dom"
axios = require "axios"
_ = require "underscore"

{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

HomeView = require "./views/HomeView.coffee"
InputView = require "./views/InputView.coffee"


{confirm} = require "antd/lib/modal"
notification = require "antd/lib/notification"

Input = require "antd/lib/input"
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
                            setEdited:(edited)=>
                                @setState({edited})
                        }}
                
                React.createElement Header, {
                    className: "header-box"
                },
                    
                    React.createElement Link, {to:"/", style:{width:"20%"}, onClick:=>@retrieveItems()},
                        React.createElement "div", {style:{width:"100%",height:"100%", backgroundColor:"green"}},
                            "списък"
                    # React.createElement Link, {to:"/input", style:{width:"20%"}, onClick:=>@setState({edited:null})}, 
                    #     React.createElement "div", {style:{width:"100%",height:"100%", backgroundColor:"purple"}},
                    #         "добави"
                    React.createElement Switch, {},
                    React.createElement Route, {path:"/input", render:=>
                        React.createElement "a", {style:{width:"20%"}, onClick:()=>
                            confirm({
                                title:"Import from wikipedia"
                                okText:"go"
                                cancelText:"back"
                                content: React.createElement Input, {
                                    ref:(f)=>@input = f
                                    defaultValue:"https://bg.wikipedia.org/wiki/%D0%91%D0%B0%D0%BB%D0%BA%D0%B0%D0%BD%D1%81%D0%BA%D0%B0_%D1%87%D1%83%D0%B1%D1%80%D0%B8%D1%86%D0%B0"
                                }

                                onOk:()=>
                                    url = @input.refs.input.value
                                    axios.post("/import", {url:url}).then((response)=>
                                        @setState({edited:response.data})
                                    ).catch((error)=>
                                        notification.open {
                                        message: 'Failed to retrieve'
                                        description: 'There may be or may be not any reason for it'
                                        }
                                    )
                            })
                        }, 
                        React.createElement "div", {style:{width:"100%",height:"100%", backgroundColor:"gold"}},
                            "wiki"
                    }
                    
                    
                        
                
                React.createElement Footer, {
                     className:"footer-box"
                },
                    React.createElement "div", {style:{width:"100%"}},
                        "растения в базата: " + @state.items?.length
                
window.onload = ->
    ReactDOM.render React.createElement(Main), document.getElementById("root")