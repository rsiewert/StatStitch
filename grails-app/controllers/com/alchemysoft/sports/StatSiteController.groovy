package com.alchemysoft.sports

class StatSiteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [statSiteInstanceList: StatSite.list(params), statSiteInstanceTotal: StatSite.count()]
    }

    def create = {
        def statSiteInstance = new StatSite()
        statSiteInstance.properties = params
        return [statSiteInstance: statSiteInstance]
    }

    def save = {
        def statSiteInstance = new StatSite(params)
        if (statSiteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'statSite.label', default: 'StatSite'), statSiteInstance.id])}"
            redirect(action: "show", id: statSiteInstance.id)
        }
        else {
            render(view: "create", model: [statSiteInstance: statSiteInstance])
        }
    }

    def show = {
        def statSiteInstance = StatSite.get(params.id)
        if (!statSiteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
            redirect(action: "list")
        }
        else {
            [statSiteInstance: statSiteInstance]
        }
    }

    def edit = {
        def statSiteInstance = StatSite.get(params.id)
        if (!statSiteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [statSiteInstance: statSiteInstance]
        }
    }

    def update = {
        def statSiteInstance = StatSite.get(params.id)
        if (statSiteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (statSiteInstance.version > version) {
                    
                    statSiteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'statSite.label', default: 'StatSite')] as Object[], "Another user has updated this StatSite while you were editing")
                    render(view: "edit", model: [statSiteInstance: statSiteInstance])
                    return
                }
            }
            statSiteInstance.properties = params
            if (!statSiteInstance.hasErrors() && statSiteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'statSite.label', default: 'StatSite'), statSiteInstance.id])}"
                redirect(action: "show", id: statSiteInstance.id)
            }
            else {
                render(view: "edit", model: [statSiteInstance: statSiteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def statSiteInstance = StatSite.get(params.id)
        if (statSiteInstance) {
            try {
                statSiteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'statSite.label', default: 'StatSite'), params.id])}"
            redirect(action: "list")
        }
    }
}
