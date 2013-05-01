# Description:
#   Pimp My Screen 
#
# Commands:
#   hubot pimp my screen <query> - Give the pms definition.
module.exports = (robot) ->
  robot.respond /(pimp my screen|pms)( me)? (.*)/i, (msg) ->
    msg.send """
      Pimp My Screen est l'ocasion de passer une journée à rendre les 3 écrans du 1er étages plus intelligents.
      Nous avons à notre disposition : 1 xbox, 2 rasperri pi, 2 apple tv, 2 écrans de 32", 1 écrans de 46" avec un windows
      embedded.
      Streamons de la musique, partageons des écrans, checkons les personnes qui sont dans le studio, 
      intégrons visuwall, github, sonar le tout via hubot ou autre.
      The sky is the limit.
      """

