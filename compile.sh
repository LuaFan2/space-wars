cd spacewars

rm -rf "gamemode"
mkdir "gamemode"

# Compile the MoonScript code into Lua.
moonc -t gamemode src

mv -v gamemode/src/* gamemode/
rmdir gamemode/src