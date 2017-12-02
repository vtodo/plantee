React = require "react"
ReactDOM = require "react-dom"
axios = require "axios"

_ = require "underscore"

Progress = require "antd/lib/progress"
Table = require "antd/lib/table"
Select = require "antd/lib/select"
Input = require "antd/lib/input"
Icon = require "antd/lib/icon"
Slider = require "antd/lib/slider"
Button = require "antd/lib/button"
Switch = require "antd/lib/switch"
notification = require "antd/lib/notification"

Form = require "antd/lib/form"
FormItem = Form.Item
SelectOption = Select.Option


class InputView extends React.Component
    render:->
        { getFieldDecorator, getFieldsError, getFieldError, isFieldTouched } = @props.form

        months = {
                    1:'януари'
                    2:'февруари'
                    3:'март'
                    4:'април'
                    5:'май'
                    6:'юни'
                    7:'юли'
                    8:'август'
                    9:'септември'
                    10:'октомври'
                    11:'ноември'
                    12:'декември'
                }

        return React.createElement Form, {
            action:"/input"
            method:"post"
            layout:"vertical"
            onSubmit:(e)=>
                e.preventDefault()
                @props.form.validateFields((err, values) => 
                    if err 
                        console.log "nah, there were errors ", err
                        return

                    console.log("form looks good, telling big brother")
                    if @props.edited
                        values.oid = @props.edited._id.$oid
                        
                    axios.post("/input", values).then(()=>
                        notification.open {
                            message: 'Success'
                            description: 'You made it'
                        }
                    ).catch(()=>
                        notification.open {
                            message: 'Fail'
                            description: 'There may be or may be not any reason for it'
                            }
                    )
                )
        },[
            React.createElement FormItem, {key:-1},
                getFieldDecorator('type', {
                    initialValue: @props.edited?.type
                    rules: [{ required: true, message: 'жизнена форма' }],
                    })(
                        React.createElement Select, {
                            mode:"combobox"
                            placeholder:"общ вид"
                            className:"input-200-20"
                        }, 
                            React.createElement SelectOption, {key:0, value:"trees"}, "Дървета"
                            React.createElement SelectOption, {key:1, value:"shrubs"}, "Храсти"
                            React.createElement SelectOption, {key:2, value:"flowers"}, "Цветя"

                            React.createElement SelectOption, {key:3, value:"ferns"}, "Папрати"
                            React.createElement SelectOption, {key:4, value:"mosses"}, "Мъхове"
                            React.createElement SelectOption, {key:5, value:"liana"}, "Лияни"
                            React.createElement SelectOption, {key:6, value:"shrooms"}, "Гъби"
                    )

            React.createElement FormItem, {key:0},
                getFieldDecorator('latin', {
                    initialValue: @props.edited?.latin
                    rules: [{ required: true, message: 'Audacter omnia complens' }],
                    })(
                        React.createElement Input, {
                            placeholder:"вид на латински"
                            className:"input-200-20"
                        }
                    )


            React.createElement FormItem, {key:1},
                getFieldDecorator('species', {
                    initialValue: @props.edited?.species
                    rules: [{ required: true, message: 'алооо' }],
                    })(
                        React.createElement Input, {
                            placeholder:"вид"
                            className:"input-200-20"
                        }
                    )

            React.createElement FormItem, {key:2},
                getFieldDecorator('division', {
                    initialValue: @props.edited?.division
                    rules: [{ required: true, message: 'задължително' }],
                    })(
                        React.createElement Input, {
                            placeholder:"отдел"
                            className:"input-200-20"
                        }
                    )
         

            React.createElement FormItem, {key:3},
                getFieldDecorator('family', {
                    initialValue: @props.edited?.family
                    rules: [{ required: true, message: 'задължително' }],
                    })(
                        React.createElement Input, {
                            placeholder:"семейство"
                            className:"input-200-20"
                        }
                    )
         
            React.createElement FormItem, {key:4},
                getFieldDecorator('cycle', {
                    initialValue: @props.edited?.cycle
                    rules: [{ required: true, message: 'жизнена форма' }],
                    })(
                        React.createElement Select, {
                            mode:"combobox"
                            placeholder:"жизнен цикъл"
                            className:"input-200-20"
                        }, 
                            React.createElement SelectOption, {key:0, value:"annual"}, "Едногодишно"
                            React.createElement SelectOption, {key:1, value:"biennial"}, "Двугодишно"
                            React.createElement SelectOption, {key:2, value:"perennial"}, "Многогодишно"
                    )

           
            React.createElement FormItem, {key:5},
                getFieldDecorator('form', {
                    initialValue: @props.edited?.form
                    rules: [{ required: true, message: 'жизнена форма' }],
                    })(
                        React.createElement Select, {
                            mode:"combobox"
                            placeholder:"жизнена форма"
                            className:"input-200-20"
                        }, 
                            React.createElement SelectOption, {key:0, value:"phanerophytes"}, "Phanerophytes"
                            React.createElement SelectOption, {key:1, value:"chamaephytes"}, "Chamaephytes"
                            React.createElement SelectOption, {key:2, value:"hemicryptophytes"}, "Hemicryptophytes"
                            React.createElement SelectOption, {key:3, value:"cryptophytes"}, "Cryptophytes"
                            React.createElement SelectOption, {key:4, value:"epiphytes"}, "Epiphytes"
                            React.createElement SelectOption, {key:5, value:"therophytes"}, "Therophytes"
                    )
           
            React.createElement FormItem, {key:6},
                getFieldDecorator('floristic', {
                    initialValue: @props.edited?.floristic
                    rules: [{ required: true, message: 'флористичен елемент' }],
                    })(
                        React.createElement Select, {
                            mode:"combobox"
                            placeholder:"флористичен елемент"
                            className:"input-200-20"
                        }, 
                            React.createElement SelectOption, {key:0, value:"adv"}, "адвентивен"
                            React.createElement SelectOption, {key:1, value:"adv-am"}, "американски"
                            React.createElement SelectOption, {key:2, value:"alp"}, "алпийски"
                            React.createElement SelectOption, {key:3, value:"anat"}, "анатолийски"
                            React.createElement SelectOption, {key:4, value:"ap"}, "апенински"
                            React.createElement SelectOption, {key:5, value:"arct"}, "арктически"
                            React.createElement SelectOption, {key:6, value:"as"}, "азиатски"
                            React.createElement SelectOption, {key:7, value:"bal"}, "балкански"
                            React.createElement SelectOption, {key:8, value:"boreal"}, "бореален"
                            React.createElement SelectOption, {key:9, value:"carp"}, "карпатски"
                            React.createElement SelectOption, {key:10, value:"dac"}, "дакийски"
                            React.createElement SelectOption, {key:11, value:"eur"}, "европейски"
                            React.createElement SelectOption, {key:12, value:"kos"}, "космополитен"
                            React.createElement SelectOption, {key:13, value:"med"}, "средиземноморски"
                            React.createElement SelectOption, {key:14, value:"ot"}, "ориентало-турански"
                            React.createElement SelectOption, {key:15, value:"pann"}, "панонски"
                            React.createElement SelectOption, {key:16, value:"pont"}, "понтийски"
                            React.createElement SelectOption, {key:17, value:"sib"}, "сибирски"
                    )

            React.createElement FormItem, {key:7},
                getFieldDecorator('endangered', {
                    initialValue: @props.edited?.endangered
                    })(
                        React.createElement Select, {
                            mode:"combobox"
                            placeholder:"ниво на застрашеност"
                            className:"input-200-20"
                        }, 
                            React.createElement SelectOption, {key:0, value:"EX"}, "EXtinct"
                            React.createElement SelectOption, {key:1, value:"RE"}, "REgionaly extinct"
                            React.createElement SelectOption, {key:2, value:"CR"}, "CRitically endangered"
                            React.createElement SelectOption, {key:3, value:"EN"}, "ENdangered"
                            React.createElement SelectOption, {key:4, value:"VU"}, "VUlnerable"
                            React.createElement SelectOption, {key:5, value:"NT"}, "Near Threatened"
                            React.createElement SelectOption, {key:6, value:"LC"}, "Least Concern"
                    )

            React.createElement FormItem, {key:8},
                getFieldDecorator('altitude', {
                    initialValue: @props.edited?.altitude
                    })(
                        React.createElement Slider, {
                            range:true
                            step:50
                            min:0
                            max:4000
                            placeholder:"височина"
                            tipFormatter:(val)=>
                                val+"m"
                            marks:{0,500,1000,2500}
                        }
                    )
            

            React.createElement FormItem, {key:9},
                getFieldDecorator('bloom', {
                    initialValue: @props.edited?.bloom                  
                    rules: [{ required: true, message: 'моля, попълне' }],
                    })(
                        React.createElement Slider, {
                            range:true
                            step:1
                            min:1
                            max:12
                            placeholder:"цъфтеж"
                            tipFormatter:(val)=>
                                return months[val]
                            marks: months
                        }
                    )

            React.createElement FormItem, {key:10},
                getFieldDecorator('edible', {
                    initialValue: @props.edited?.edible
                    valuePropName:"checked"
                    })(
                        React.createElement Switch, {
                            checkedChildren:"ядливо"
                            unCheckedChildren:"не се яде"
                        }
                    )

            React.createElement FormItem, {key:11},
                getFieldDecorator('herb', {
                    initialValue: @props.edited?.herb
                    valuePropName:"checked"
                    })(
                        React.createElement Switch, {
                            checkedChildren:"билка"
                            unCheckedChildren:"няма полезни свойства"
                        }
                    )

            React.createElement FormItem, {key:12},
                getFieldDecorator('law', {
                    initialValue: @props.edited?.law
                    valuePropName:"checked"
                    })(
                        React.createElement Switch, {
                            checkedChildren:"защитено от МВР"
                            unCheckedChildren:"незащитено"
                        }
                    )

            React.createElement FormItem, {key:13},
                getFieldDecorator('image', {
                    initialValue: @props.edited?.image
                })(
                        React.createElement Input, {
                            placeholder:"image url"
                            className:"input-200-20"
                        }
                    )

            React.createElement FormItem, {key:20},
                React.createElement Button, {
                    type:"primary"
                    htmlType:"submit"
                    className:"input-200-20"
                }, "Запази"
            
            React.createElement Button, {
                key:"21"
                type:"danger"
                onClick:=>
                    if confirm("You sure?")
                        alert("WOW")
            }, "Изтрий"
        ]   
        
module.exports = Form.create()(InputView)