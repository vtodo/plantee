React = require "react"
ReactDOM = require "react-dom"
{ Link, BrowserRouter, Route, Switch } = require "react-router-dom"

Row = require("antd/lib/row")
Col = require("antd/lib/col")
Card = require("antd/lib/card")

Icon = require("antd/lib/icon")
Input = require("antd/lib/input")
axios = require "axios"
QueueAnim = require "rc-queue-anim";
Parallax = require "rc-scroll-anim/lib/ScrollParallax";

class HomeView extends React.Component
    constructor:->
        super arguments...

    render:->
        len = @props.items?.length
        if not len
            return null

        React.createElement Row, {gutter:16},
            React.createElement Col, {md:8, xs:24},
                React.createElement Card, {
                    className:"home-card"                    
                    title:"Последно добавени растения"
                },  
                    for i in [len-1..0]
                        React.createElement "li", {key:i},
                            React.createElement Link, {
                                to:"/input"
                                onClick:((j)=>=>@props.setEdited(@props.items[j]))(i)
                                style:{color:"black"}
                            }, @props.items[i].species
            
                   
            React.createElement Col, {md:{offset:1, span:15}, xs:24},           
                React.createElement QueueAnim, {leaveReverse:true, type:"right", interval:100, duration:250, delay:300},
                    for i in [len-1..0]
                        # React.createElement Parallax, {key:i, animation:{opacity:1}, style:{opacity: 0, margin: '10px auto' }},
                        React.createElement "div", {key:i},
                            React.createElement Card, {
                                key:i
                                className:"home-card"
                                title:@props.items[i].species + " / " + @props.items[i].latin 
                                extra: React.createElement Link, {
                                        to:"/input"
                                        onClick:((j)=>=>@props.setEdited(@props.items[j]))(i)
                                    }, 
                                    React.createElement Icon, {style:{fontSize:40, color:"red"}, type:"edit"}
                            },
                                React.createElement Row, {},
                                    React.createElement Col, {span:12},
                                        React.createElement "div",{}, "общ вид "+@props.items[i].type
                                        React.createElement "div",{}, "отдел "+@props.items[i].division
                                        React.createElement "div",{}, "семейство "+@props.items[i].family
                                        React.createElement "div",{}, "жизнен цикъл "+@props.items[i].cycle
                                        React.createElement "div",{}, "флористичен елемент "+@props.items[i].floristic
                                        if @props.items[i].endangered
                                            React.createElement "div",{}, "ниво на застрашеност "+@props.items[i].endangered
                                        if @props.items[i].edible
                                            React.createElement "div",{}, "ядливо "
                                        if @props.items[i].herb
                                            React.createElement "div",{}, "билка "
                                        if @props.items[i].law
                                            React.createElement "div",{}, "защитено от закона "
                                    React.createElement Col, {span:7, offset:4},     

                                        React.createElement "img",{
                                            src:@props.items[i].image
                                            # className:"preview-box"
                                            style:{
                                                width:"100%"
                                                objectFit:"cover"
                                            }
                                        }                                  
                                
                
module.exports = HomeView