package com.alchemysoft.sports

class ConferenceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conferenceInstanceList: Conference.list(params), conferenceInstanceTotal: Conference.count()]
    }

    def create = {
        def conferenceInstance = new Conference()
        conferenceInstance.properties = params
        return [conferenceInstance: conferenceInstance]
    }

    def save = {
        def conferenceInstance = new Conference(params)
        if (conferenceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'conference.label', default: 'Conference'), conferenceInstance.id])}"
            redirect(action: "show", id: conferenceInstance.id)
        }
        else {
            render(view: "create", model: [conferenceInstance: conferenceInstance])
        }
    }

    def show = {
        def conferenceInstance = Conference.get(params.id)
        if (!conferenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
            redirect(action: "list")
        }
        else {
            [conferenceInstance: conferenceInstance]
        }
    }

    def edit = {
        def conferenceInstance = Conference.get(params.id)
        if (!conferenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [conferenceInstance: conferenceInstance]
        }
    }

    def update = {
        def conferenceInstance = Conference.get(params.id)
        if (conferenceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (conferenceInstance.version > version) {
                    
                    conferenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'conference.label', default: 'Conference')] as Object[], "Another user has updated this Conference while you were editing")
                    render(view: "edit", model: [conferenceInstance: conferenceInstance])
                    return
                }
            }
            conferenceInstance.properties = params
            if (!conferenceInstance.hasErrors() && conferenceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'conference.label', default: 'Conference'), conferenceInstance.id])}"
                redirect(action: "show", id: conferenceInstance.id)
            }
            else {
                render(view: "edit", model: [conferenceInstance: conferenceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def conferenceInstance = Conference.get(params.id)
        if (conferenceInstance) {
            try {
                conferenceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), params.id])}"
            redirect(action: "list")
        }
    }
}
