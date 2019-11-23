vcl 4.0;

import std;
import bodyaccess;

backend default {
    .host = "web-app";
    .port = "8080";
    .first_byte_timeout = 6s;
}

sub vcl_deliver {
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
    } else {
        set resp.http.X-Cache = "MISS";
    }
}

sub vcl_recv {

    if (req.method != "GET" && req.method != "HEAD" && req.method != "POST") {
        return(pass);
    }

    if (req.method == "POST") {
        std.cache_req_body(500KB);
        set req.http.X-Body-Len = bodyaccess.len_req_body();

        if (req.http.X-Body-Len == "-1") {
            return (pass);
        }

        return(hash);
    }
}

sub vcl_hash {
    if (req.http.X-Body-Len) {
        bodyaccess.hash_req_body();
    }
}

sub vcl_backend_fetch {
    if (bereq.http.X-Body-Len) {
        set bereq.method = "POST";
    }
}