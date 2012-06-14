import tmdb

main: func {
    "Hi, TMDb world!" println()
    client := TMDb new("config/credentials.zc")

    resp := client search("Shrek")
    resp println()
}

