package com.alchemysoft.sports

class Player {
    static constraints = {
    }

    static belongsTo = [team:Team]

    String name
    String player_position
    String dob
    String college
    String yearsPlayed
}
