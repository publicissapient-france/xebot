# Description:
#   Pimp My Screen 
#
# Commands:
#   hubot pimp my screen - Give the pms definition.
module.exports = (robot) ->
  robot.respond /(.*) (pimp my screen|pms)/i, (msg) ->
    msg.send """
      Pimp My Screen est l'occasion de passer une journée à rendre les 3 écrans du 1er étage plus intelligents.
      Nous avons à notre disposition : 1 xbox, 2 raspberry pi, 2 apple tv, 2 écrans de 32", 1 écrans de 46" avec un windows
      embedded.
      Streamons de la musique, partageons des écrans, checkons les personnes qui sont dans le studio, 
      intégrons visuwall, github, sonar le tout via hubot ou autre.

      The sky is the limit.
      
      Pour participer il te faut de la bonne humeur, un peu d'esprit de hacking & te dire que tu vas probablement te passer 
      de java pendant 1 journée (c'est pas sale ;).
      Bon XKE.
      """

