package com.alchemysoft.sports

class League {
    static constraints = {
    }

    String name

    static hasMany = [conferences:Conference]

    String toString() {
      return name
    }
}
