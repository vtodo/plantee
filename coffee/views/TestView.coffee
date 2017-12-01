React = require "react"
ReactDOM = require "react-dom"

TweenOne = require "rc-tween-one"
PathPlugin = require "rc-tween-one/lib/plugin/PathPlugin"
TweenOne.plugins.push PathPlugin

class TestView extends React.Component
    constructor:->
        @path = "m 322.85715,198.07649 c 0.42975,-8.73841 11.99122,-3.73192 14.52381,0.71428 6.86314,12.04893 -4.52351,25.3049 -15.95237,28.33334 -20.44355,5.41717 -39.01385,-11.79684 -42.14287,-31.19045 -4.59197,-28.46092 19.11192,-52.97159 46.42854,-55.9524 36.40877,-3.97297 67.02587,26.43435 69.76193,61.66663 3.44306,44.33622 -33.75847,81.12817 -76.90471,83.57146 -52.25589,2.95914 -95.25795,-41.08318 -97.381,-92.14281 -2.50194,-60.172 48.40819,-109.40488 107.3809,-111.190522 C 396.6577,79.824423 452.13466,137.61943 453.57143,204.505 455.20398,280.50464 390.51264,342.23473 315.71436,343.31459 231.80199,344.52602 163.81235,272.93029 163.09524,190.21943 162.29912,98.394698 240.80517,24.140744 331.42849,23.79078"

        @animation = {
            path: this.path
            repeat: -1
            duration: 5000
            ease: "linear"
        }
    render:-> 
        React.DOM.div {},
            React.createElement TweenOne, {
                animation:@animation
                style:{
                    margin: 0
                    width: 20
                    height: 20
                    backgroundColor: "red"
                    borderRadius: "4px"
                    transform: "translate(-10px, -10px)"
                }
            }
            React.DOM.svg { width:300, height:300 },
                React.DOM.path {d:@path, fill:"none", stroke:"rgba(1,155,240,.2)"}


module.exports = TestView