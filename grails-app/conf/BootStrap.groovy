import com.alchemysoft.sports.*

class BootStrap {

    def init = { servletContext ->


      def afcconf = new Conference(name:"AFC")
      def nfcconf = new Conference(name:"NFC")
      def nfl = new League(name:"NFL").save()
      def nba = new League(name:"NBA").save()
      def div = new Division(name:"Atlantic")
      def team = new Team(name:"New England Patriots")
      def tombrady = new Player(name:"Tom Brady",player_position: "QB",dob:"unknown",college:"Michigan",yearsPlayed: "10")
      team.addToPlayers(tombrady)


      nfl.addToConferences(afcconf)
      nfl.addToConferences(nfcconf)
      afcconf.addToDivisions(div)
      div.addToTeams(team)
      team = new Team(name:"New York Jets")
      div.addToTeams(team)
      def msanchez = new Player(name:"Mark Sanchez",player_position: "QB",dob:"unknown",college:"unknown",yearsPlayed: "8")
      team.addToPlayers(msanchez)
    }
    def destroy = {
    }
}
