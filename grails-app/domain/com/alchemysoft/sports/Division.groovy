package com.alchemysoft.sports

class Division {

    static constraints = {
    }

    String name

    static hasMany = [teams:Team]

    static belongsTo = [conference:Conference]

    String toString() {
      return name
    }
}
