"use strict";

exports.urlSearchParamsImpl = function(x) {
    return new URLSearchParams(x);
};

exports.appendImpl = function(name) {
    return function(value) {
        return function(p) {
            var n = new URLSearchParams(p);
            n.append(name, value);
            return n;
        }
    }
};

exports.deleteImpl = function(name) {
    return function(p) {
        var n = new URLSearchParams(p);
        n.delete(name);
        return n;
    }
};

exports.entriesImpl = function(tuple) {
    return function(p) {
        var a = [];
        for (const e of p.entries()) {
            a.push(tuple(e[0])(e[1]));
        }
        return a;
    }
};

exports.getImpl = function(just) {
    return function(nothing) {
        return function(name) {
            return function(p) {
                var v = p.get(name);
                if (v === null) {
                    return nothing;
                } else {
                    return just(v);
                }
            }
        }
    }
};

exports.getAllImpl = function(name) {
    return function(p) {
        return p.getAll(name);
    }
};

exports.hasImpl = function(name) {
    return function(p) {
        return p.has(name);
    }
};

exports.setImpl = function(name) {
    return function(value) {
        return function(p) {
            var n = new URLSearchParams(p);
            n.set(name, value);
            return n;
        }
    }
};

exports.sortImpl = function(p) {
    var n = new URLSearchParams(p);
    n.sort();
    return n;
};

exports.toStringImpl = function(p) {
    return p.toString();
};
