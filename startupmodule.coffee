
startupmodule = {name: "startupmodule"}
############################################################
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["startupmodule"]?  then console.log "[startupmodule]: " + arg
    return

############################################################
bot = null
sci = null
intelligence = null

############################################################
export initialize = ->
    log "startupmodule.initialize"
    bot = allModules.telegrambotmodule
    sci = allModules.scimodule
    intelligence = allModules.intelligencemodule
    return

############################################################
export serviceStartup = ->
    log "startupmodule.serviceStartup"
    try
        sci.prepareAndExpose()
        intelligence.startProcessing()
    catch err then bot.send(err.stack)
    return

