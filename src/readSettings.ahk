#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

readSettings(settingsFile, ByRef settings) {
    IniRead, baseUrl, settings.ini, MapHost, baseUrl, ""

    IniRead, maxWidth, settings.ini, MapSettings, maxWidth, 2000
    IniRead, scale, settings.ini, MapSettings, scale, 1.0
    IniRead, topMargin, settings.ini, MapSettings, topMargin, 50
    IniRead, leftMargin, settings.ini, MapSettings, leftMargin, 50
    IniRead, opacity, settings.ini, MapSettings, opacity, 0.5
    IniRead, alwaysShowMap, settings.ini, MapSettings, alwaysShowMap, "false"
    IniRead, hideTown, settings.ini, MapSettings, hideTown, "false"

    IniRead, showNormalMobs, settings.ini, MapSettings, showNormalMobs, "true"
    IniRead, showUniqueMobs, settings.ini, MapSettings, showUniqueMobs, "true"
    IniRead, showBosses, settings.ini, MapSettings, showBosses, "true"
    IniRead, normalMobColor, settings.ini, MapSettings, normalMobColor, "FFFFFF"
    IniRead, uniqueMobColor, settings.ini, MapSettings, uniqueMobColor, "D4AF37"
    IniRead, bossColor, settings.ini, MapSettings, bossColor, "FF0000"

    IniRead, showWaypointLine, settings.ini, MapSettings, showWaypointLine, "false"
    IniRead, showNextExitLine, settings.ini, MapSettings, showNextExitLine, "true"

    IniRead, increaseMapSizeKey, settings.ini, Shortcuts, increaseMapSizeKey, NumpadAdd
    IniRead, decreaseMapSizeKey, settings.ini, Shortcuts, decreaseMapSizeKey, NumpadSub
    IniRead, alwaysShowKey, settings.ini, Shortcuts, alwaysShowKey, NumpadMult

    IniRead, playerOffset, settings.ini, Memory, playerOffset
    IniRead, uiOffset, settings.ini, Memory, uiOffset
    IniRead, readInterval, settings.ini, Memory, readInterval, 1000

    IniRead, enableD2ML, settings.ini, MultiLaunch, enableD2ML
    if (enableD2ML == "true") {
        IniRead, gameWindowId, settings.ini, MultiLaunch, windowTitle
    } else {
        gameWindowId := "ahk_exe D2R.exe"
    }
    IniRead, debug, settings.ini, Logging, debug, "false"

    ; Here is a good example of why AHK sucks
    hideTown := hideTown = "true" ; convert to bool
    alwaysShowMap := alwaysShowMap = "true" ; convert to bool
    showNormalMobs := showNormalMobs = "true" ; convert to bool
    showUniqueMobs := showUniqueMobs = "true" ; convert to bool
    showWaypointLine := showWaypointLine = "true" ; convert to bool
    showNextExitLine := showNextExitLine = "true" ; convert to bool

    ; AHK also doesn't let you declare an array a more sensible way
    settings := {}
    settings.Insert("baseUrl", baseUrl)
    settings.Insert("maxWidth", maxWidth)
    settings.Insert("scale", scale)
    settings.Insert("leftMargin", leftMargin)
    settings.Insert("topMargin", topMargin)
    settings.Insert("opacity", opacity)
    settings.Insert("alwaysShowMap", alwaysShowMap)
    settings.Insert("hideTown", hideTown)
    settings.Insert("showNormalMobs", showNormalMobs)
    settings.Insert("showUniqueMobs", showUniqueMobs)
    settings.Insert("showBosses", showBosses)
    settings.Insert("normalMobColor", normalMobColor)
    settings.Insert("uniqueMobColor", uniqueMobColor)
    settings.Insert("bossColor", bossColor)
    settings.Insert("showWaypointLine", showWaypointLine)
    settings.Insert("showNextExitLine", showNextExitLine)
    settings.Insert("increaseMapSizeKey", increaseMapSizeKey)
    settings.Insert("decreaseMapSizeKey", decreaseMapSizeKey)
    settings.Insert("alwaysShowKey", alwaysShowKey)
    settings.Insert("playerOffset", playerOffset)
    settings.Insert("uiOffset", uiOffset)
    settings.Insert("readInterval", readInterval)
    settings.Insert("enableD2ML", enableD2ML)
    settings.Insert("gameWindowId", gameWindowId)
    settings.Insert("debug", debug)

    WriteLog("Using configuration:")
    WriteLog(" baseUrl: " baseUrl)
    WriteLog(" Map: maxWidth: " maxWidth ", scale: " scale ", topMargin: " topMargin ", leftMargin: " leftMargin ", opacity: " opacity)
    WriteLog(" hideTown: " hideTown ", alwaysShowMap: " alwaysShowMap)
    WriteLog(" showNormalMobs: " showNormalMobs " showUniqueMobs: " showUniqueMobs)
    WriteLog(" normalMobColor: " normalMobColor " uniqueMobColor: " uniqueMobColor)
    WriteLog(" startingOffset: " startingOffset)
    WriteLog(" showWaypointLine: " showWaypointLine)
    WriteLog(" showNextExitLine: " showNextExitLine)
    WriteLog(" gameWindowId: " gameWindowId)
    WriteLog(" debug logging: " debug)
}