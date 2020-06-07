"use strict";

exports.urlImpl = function(just) {
    return function(nothing) {
        return function(base) {
            try {
                return new URL(base);
            } catch (TypeError) {
                return undefined;
            }
        }
    }
};

exports.url2Impl = function(just) {
    return function(nothing) {
        return function(rel) {
            return function(base) {
                try {
                    return just(new URL(rel, base));
                } catch (TypeError) {
                    return nothing;
                }
            }
        }
    }
};

exports.toString     = function(url) { return url.toString(); };
exports.hash         = function(url) { return url.hash; }
exports.host         = function(url) { return url.host; }
exports.hostname     = function(url) { return url.hostname; }
exports.href         = function(url) { return url.href; }
exports.origin       = function(url) { return url.origin; }
exports.password     = function(url) { return url.password; }
exports.pathname     = function(url) { return url.pathname; }
exports.port         = function(url) { return url.port; }
exports.protocol     = function(url) { return url.protocol; }
exports.search       = function(url) { return url.search; }
exports.searchParams = function(url) { return url.searchParams; }
exports.username     = function(url) { return url.username; }

exports.setHash     = function(v) { return function(url) { u = new URL(url); u.hash = v; return u; } }
exports.setHost     = function(v) { return function(url) { u = new URL(url); u.host = v; return u; } }
exports.setHostname = function(v) { return function(url) { u = new URL(url); u.hostname = v; return u; } }
exports.setHref     = function(v) { return function(url) { u = new URL(url); u.href = v; return u; } }
exports.setPassword = function(v) { return function(url) { u = new URL(url); u.password = v; return u; } }
exports.setPathname = function(v) { return function(url) { u = new URL(url); u.pathname = v; return u; } }
exports.setPort     = function(v) { return function(url) { u = new URL(url); u.port = v; return u; } }
exports.setProtocol = function(v) { return function(url) { u = new URL(url); u.protocol = v; return u; } }
exports.setSearch   = function(v) { return function(url) { u = new URL(url); u.search = v; return u; } }
exports.setUsername = function(v) { return function(url) { u = new URL(url); u.username = v; return u; } }
