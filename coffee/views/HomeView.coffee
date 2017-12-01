React = require "react"
ReactDOM = require "react-dom"
{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

Row = require("antd/lib/row")
Col = require("antd/lib/col")
Card = require("antd/lib/card")
axios = require "axios"

class HomeView extends React.Component
    constructor:->
        super arguments...
        @state = {
            selected:-1
            items:[]
        }

    componentWillMount:->
        axios.get('/dumps').then((response)=>
            @setState({items:response.data})
        ).catch((err)=>return)
    render:->
        len = @state.items?.length
        selected = null
        if @state.selected != -1
            selected = @state.items[@state.selected]

        React.createElement Row, {gutter:16},
            React.createElement Col, {md:8, xs:24},
                React.createElement Card, {
                    className:"home-card"                    
                    title:"Последно добавени растения"
                },  
                    for i in [0...len]
                        React.DOM.li {key:i},
                            React.createElement "a", {
                                style:{color:"black"}
                                onClick:((t)=>
                                    j = t
                                    ()=>
                                        @setState({selected:j})
                                )(i)
                            }, @state.items[i].species
            
            if selected       
                React.createElement Col, {md:14, xs:24},
                    React.createElement Card, {
                        className:"home-card"
                        title:selected.species + " / " + selected.latin + " / " + selected.english
                    },
                        React.createElement "div",{}, "общ вид "+selected.type
                        React.createElement "div",{}, "отдел "+selected.division
                        React.createElement "div",{}, "семейство "+selected.family
                        React.createElement "div",{}, "жизнен цикъл "+selected.cycle
                        React.createElement "div",{}, "жизнена форма "+selected.form
                        React.createElement "div",{}, "флористичен елемент "+selected.floristic
                        React.createElement "div",{}, "ниво на застрашеност "+selected.endangered
                        React.createElement "div",{}, "ядливо "+selected.edible
                        React.createElement "div",{}, "билка "+selected.herb
                        React.createElement "img",{
                            src:selected.image
                            width:200
                            height:150
                            style:{
                                objectFit:"cover"
                                position:"absolute"
                                top:"80px"
                                right:"20px"
                            }
                        }
                


module.exports = HomeView