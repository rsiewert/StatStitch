package com.alchemysoft.sports

import com.alchemysoft.sports.Conference
import com.alchemysoft.sports.Player

class Team {
    static constraints = {
    }

    static hasMany    = [players:Player]
    static belongsTo  = [division:Division]

    String name

    String toString() {
      return name
    }

}
