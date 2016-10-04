# app = app or {}
# class app.SettingView extends Backbone.View
#     tagName: 'div'
#     template: _.template($('#item-template').html())
#     render: ->
#         @$el.html @template(@model.toJSON())
#         this
#     initialize: ->
#         @model.on 'change', @render, this
#         return
