React = require "react"

_ = require "underscore"
axios = require "axios"

Sigma = require("react-sigma/lib/Sigma").default
RandomizeNodePositions = require("react-sigma/lib/RandomizeNodePositions").default
RelativeSize = require("react-sigma/lib/RelativeSize").default
ForceLink = require("react-sigma/lib/ForceLink").default

class GraphView extends React.Component

    constructor:->
        super arguments...
        @sigma = null
        
    componentWillMount:->
        # @sigma?.graph.clear()

    render:->
        graph = {
                nodes:  @props.criteria.nodes
                edges:  @props.criteria.edges
            }

        React.createElement Sigma, {
            onOverNode:(e)=>
                sigma = e.target
                node = e.data.node
                # for e in sigma.graph.edges()
                    # if e.target == node.id or e.source == node.id
                        # e.
                console.log arguments
            onOutNode:=>
                console.log arguments
                
            key:Math.random()*100
            id:"sigma-main"
            renderer:"webgl"
            className:"sigma-main"
            style:{
                width:"100%"
                height:"100%"
            }
            graph : graph
            settings:{
                drawEdges:true
                clone:false
                font:"GEO"
                labelThreshold:6
            }
        }, 
        
            React.createElement RandomizeNodePositions, {}
            React.createElement ForceLink, {
                randomize:"locally"
                easing:"cubicInOut"
                barnesHutOptimize:true
                adjustSizes:true

                autoStop:false
                # avgDistanceThreshold:.003
                # alignNodeSiblings:true
                strongGravityMode:true
                outboundAttractionDistribution:true
                # scalingRatio:2
            }

module.exports = GraphView