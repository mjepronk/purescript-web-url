exports.mkURL = function(base) {
    try {
        return new URL(base);
    } catch (TypeError) {
        return undefined;
    }
};

exports.mkURLRel = function(rel, base) {
    try {
        return new URL(rel, base);
    } catch (TypeError) {
        return undefined;
    }
};

exports.isUndefined = function(value) {
    return value === undefined;
};

exports.toString = function(url) { return url.toString(); };
exports.hash = function(url) { return url.hash; }
exports.host = function(url) { return url.host; }
exports.hostname = function(url) { return url.hostname; }
exports.href = function(url) { return url.href; }
exports.origin = function(url) { return url.origin; }
exports.password = function(url) { return url.password; }
exports.pathname = function(url) { return url.pathname; }
exports.port = function(url) { return url.port; }
exports.protocol = function(url) { return url.protocol; }
exports.search = function(url) { return url.search; }
exports.searchParams = function(url) { return url.searchParams; }
exports.username = function(url) { return url.username; }
