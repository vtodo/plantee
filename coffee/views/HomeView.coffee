React = require "react"
ReactDOM = require "react-dom"
{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

Row = require("antd/lib/row")
Col = require("antd/lib/col")
Card = require("antd/lib/card")

Icon = require("antd/lib/icon")
axios = require "axios"

class HomeView extends React.Component
    constructor:->
        super arguments...
        @state = {
            selected:-1
        }

    render:->
        len = @props.items?.length
        selected = null
        if @state.selected != -1
            selected = @props.items[@state.selected]

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
                            }, @props.items[i].species
            
            if selected       
                React.createElement Col, {md:14, xs:24},
                    React.createElement Card, {
                        className:"home-card"
                        title:selected.species + " / " + selected.latin 
                        extra: React.createElement Link, {to:"/input", onClick:=>@props.setEdited(@state.selected)}, 
                            React.createElement Icon, {style:{fontSize:40, color:"red"}, type:"edit"}
                    },
                        React.createElement "div",{}, "общ вид "+selected.type
                        React.createElement "div",{}, "отдел "+selected.division
                        React.createElement "div",{}, "семейство "+selected.family
                        React.createElement "div",{}, "жизнен цикъл "+selected.cycle
                        React.createElement "div",{}, "флористичен елемент "+selected.floristic
                        if selected.endangered
                            React.createElement "div",{}, "ниво на застрашеност "+selected.endangered
                        if selected.edible
                            React.createElement "div",{}, "ядливо "
                        if selected.herb
                            React.createElement "div",{}, "билка "
                        if selected.law
                            React.createElement "div",{}, "защитено от закона "
                        if selected.image
                            React.createElement "img",{
                                src:selected.image
                                className:"preview-box"
                            }
                
module.exports = HomeView