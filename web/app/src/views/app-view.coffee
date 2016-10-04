app = app or {}
class app.AppView extends Backbone.View
    el: '#settingapp'
    initialize: ->
        return
    events:
        'click #edit-open': 'editOpen'
        'click #send': 'sendAjax'
        'click #save': 'save'
        'click #close': 'close'
        'change .setting-edit': 'newSetting'

    editOpen: ->
        $('#modal-open').modal('show')
        @newSetting()
        return

    newSetting: ->
        date = new Date(@$('#userBirthday').val())
        @setting =
            userName: @$('#userName').val().trim()
            birthdate:
                day: date.getDate()
                month: date.getMonth() + 1
                year: date.getFullYear()
            email: @$('#userEmail').val().trim()
            userUrl: @$('#userUrl').val().trim()
            phoneNumber: @$('#userPhone').val().trim()
            skillNumber: @$('#userSkill').val().trim()
            password:
                first: @$('#password').val().trim()
                second: @$('#password-confirm').val().trim()
            userAbout: @$('#userAbout').val().trim()
            userGender: @$(".gender:checked").val()
            userToken: @$("#user__token").val().trim()

    close: ->
        $('#modal-open').modal('hide')
        $( ".modal-backdrop" ).remove()
        return

    save: ->
        $('#modal-open').modal('hide')
        $( ".modal-backdrop" ).remove()
        data = user:
            userName: @setting.userName
            userBirthday:
                month: @setting.birthdate.month
                day: @setting.birthdate.day
                year: @setting.birthdate.year
            userEmail: @setting.email
            siteUrl: @setting.userUrl
            userPhone: @setting.phoneNumber
            userSkill: @setting.skillNumber
            password:
                first: @setting.password.first
                second: @setting.password.second
            userAbout: @setting.userAbout
            userGender: @setting.userGender
            _token: @setting.userToken
        $.ajax
            method: 'POST'
            url: 'http://backbone.tld/process-form'
            data: data
            success: (data)->
                console.log data
        return
