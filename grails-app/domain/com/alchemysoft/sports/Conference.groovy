package com.alchemysoft.sports

class Conference {

    static constraints = {
    }

    String name

    static belongsTo  = [league:League]
    static hasMany    = [divisions:Division]

    String toString() {
      return name
    }
}
