app = app or {}
class app.EditView extends Backbone.View
    # tagName: 'div'
    # template: _.template($('#edit-template').html())
    # render: ->
    #     @$el.html @template(@model.toJSON())
    #     @setting =
    #         userName: @$('#user-name')
    #         birthdate: @$('#birthdate')
    #         email: @$('#email')
    #         phoneNumber: @$('#phone-number')
    #         skillNumber: @$('#skill-number')
    #         password: @$('#password')
    #         userUrl: @$('#user-url')
    #         description: @$('#description')
    #         male: @$('#male')
    #         female: @$('#female')
    #     this
    # initialize: ->
    #     @model.on 'change', @render, this
    #     return
    events:
        'keypress .setting-input': 'updateOnEnter'
        'click #save': 'save'
    # edit: ->
    #     @$el.addClass 'editing'
    #     @input.focus()
    #     return
    close: ->
        $('#modal-open').modal('hide');
        $( ".modal-backdrop" ).remove();
        @model.set
            userName: @setting.userName.val().trim()
            birthdate: @setting.birthdate.val().trim()
            email: @setting.email.val().trim()
            userUrl: @setting.userUrl.val().trim()
            phoneNumber: @setting.phoneNumber.val().trim()
            skillNumber: @setting.skillNumber.val().trim()
            password: @setting.password.val().trim()
            description: @setting.description.val().trim()
            male: @setting.male.val().trim()
            female: @setting.female.val().trim()
        return
    updateOnEnter: (e) ->
        if e.which == 13
            @close()
        return

    save: ->
        newData = $('#edit-user').serialize();
        log
        @close()
        return
