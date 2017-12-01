React = require "react"
ReactDOM = require "react-dom"
axios = require "axios"

_ = require "underscore"

Progress = require "antd/lib/progress"
Table = require "antd/lib/table"

class TasksView extends React.Component
    constructor:->
        super arguments...
        @state = {
            tasks:[]
        }

    componentWillMount:->
        axios.get("/tasks").then(
            (result)=>
                @setState {tasks: result.data}
        )
    
    render:->
        if @state.tasks.length == 0
            return null
        #caption , duration, worker, status
        data = (_.extend( {key:i}, task) for task, i in @state.tasks when task.worker )
        workers = _.uniq (t.worker for t in @state.tasks when t.worker)

        pending_tasks = @state.tasks.filter( (task)-> return task.status == "pending")
        percent_done = 100*(@state.tasks.length - pending_tasks.length)/@state.tasks.length
        
        peers_data = [
        ]

        for worker in workers
            worker_tasks =  @state.tasks.filter( (task)-> return task.worker == worker)
            jobs_done = worker_tasks.length
            duration = 0
            for task in worker_tasks
                if task.duration
                    duration += task.duration
            # duration += task.duration for task in worker_tasks
            mid_duration = duration/jobs_done 

            peers_data.push {worker, jobs_done, mid_duration}
        
        peers_cols = [
            {
                title:"Работник"
                dataIndex:"worker"
                key:"worker"
            }
            {
                title:"Свършена работа"
                dataIndex:"jobs_done"
                key:"jobs_done"
            }
            {
                title:"Средно време"
                dataIndex:"mid_duration"
                key:"mid_duration"
            }
        ]
        cols = [
            {
                title:"Работник"
                dataIndex:"worker"
                key:"worker"
            }
            {
                title:"Заглавие"
                dataIndex:"caption"
                key:"caption"
            }
            {
                title:"Статус"
                dataIndex:"status"
                key:"status"
            }
            {
                title:"Продължителност"
                dataIndex:"duration"
                key:"duration"
            }
        ]
        React.DOM.div {},
            React.DOM.h2 {}, "Оставаща работа: " + pending_tasks.length
            React.createElement Progress, {
                percent: parseInt percent_done
                status: if parseInt(percent_done) != 100 then "active" else "success"
            }
            React.DOM.br {}
            React.DOM.br {}

            React.createElement Table, {
                columns: peers_cols
                dataSource: peers_data
                pagination: false

            }
            React.DOM.br {}
            
            React.createElement Table, {
                columns: cols
                dataSource: data.reverse()
            }

module.exports = TasksView