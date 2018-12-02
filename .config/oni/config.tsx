
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    //oni.input.bind("<f7>", "language.findAllReferences")
    //oni.input.bind("<f8>", "language.findAllReferences")
    //oni.input.bind("<f9>", "language.findAllReferences")
    oni.input.bind("<f10>", "language.findAllReferences")
    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as

    //"oni.bookmarks": ["~/Documents"],
    //"editor.fontSize": "12px",
    //"editor.fontFamily": "Monaco",

    "oni.useDefaultConfig": false,
    "oni.loadInitVim": true,

    // UI customizations
    "ui.colorscheme": "n/a",
    "ui.animations.enabled": false,
    "ui.fontSmoothing": "auto",
    "statusbar.enabled": false,

    "oni.hideMenu": true,
    "autoUpdate.enabled": true,
    "brownser.enabled": false,
    "autoClosingPairs.enabled" : false, // disable autoclosing pairs
    "learning.enabled"         : false, // Turn off learning pane
    "achievements.enabled"     : false, // Turn off achievements tracking / UX
    "editor.textMateHighlighting.enabled" : false, // Use vim syntax highlighting
    "editor.maximizeScreenOnStart": true,
    "commandline.mode"         : false, // Do not override commandline UI
    "sidebar.enabled": false

    "language.c.languageServer.command": "/opt/cquery/bin/cquery",
    "language.c.languageServer.arguments": [
        `--init={"cacheDirectory": "/tmp/cquery.cache"}`
    ],
    "language.c.languageServer.rootFiles": ["compile_commands.json"]

    "language.cpp.languageServer.command": "/opt/cquery/bin/cquery",
    "language.cpp.languageServer.arguments": [
        `--init={"cacheDirectory": "/tmp/cquery.cache"}`
    ],
    "language.cpp.languageServer.rootFiles": ["compile_commands.json"]

    "language.python.languageServer.command": "/home/elecfist/.local/bin/pyls"
}
 
