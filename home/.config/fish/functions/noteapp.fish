function noteapp
    set notePath "$HOME/notes"
    set noteFilename "$notePath/quicknote.md"

    mkdir -p $notePath
    cd $notePath

    hx $noteFilename
end
