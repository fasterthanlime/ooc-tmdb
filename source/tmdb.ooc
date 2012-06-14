use endorse, zombieconfig, curl

import structs/[ArrayList, HashMap]
import zombieconfig, curl/Highlevel, endorse

TMDb: class {

    config: ZombieConfig
    baseUrl := "http://api.themoviedb.org/3/search/movie"

    init: func (configPath: String) {
        config = ZombieConfig new(configPath)
    }

    search: func (query: String) -> String {
        request("/search/movie", map("query" => query))
    }

    /*
     * private methods
     */

    encode_parameters: func (params: HashMap<String, String>) -> String {
        buffer := Buffer new()
        first := true
        params each(|k, v|
            if (first) {
                first = false
            } else {
                buffer append("&")
            }
            buffer append(k). append("="). append(v)
        )
        buffer toString()
    }

    request: func (path: String, params: HashMap<String, String>) -> String {
        url := baseUrl + path

        encoded := encode_parameters(params)
        if (encoded) {
            url += "?"
            url += encoded
        }
        "HTTP GET %s" printfln(url)

        HTTP get(url)
    }

}

