"use strict";

exports.appendImpl = function(name) {
    return function(value) {
        return function(p) {
            var n = new URLSearchParams(p);
            n.append(name, value);
            return n;
        }
    }
}

exports.deleteImpl = function(name) {
    return function(p) {
        var n = new URLSearchParams(p);
        n.delete(name);
        return n;
    }
}

exports.entriesImpl = function(p) {
    return Array.from(p.entries());
}

exports.getImpl = function(name) {
    return function(p) {
        return p.get(name);
    }
}

exports.getAllImpl = function(name) {
    return function(p) {
        return p.getAll('name');
    }
}

exports.hasImpl = function(name) {
    return function(p) {
        return p.has(name);
    }
}

exports.setImpl = function(name) {
    return function(value) {
        return function(p) {
            var n = new URLSearchParams(p);
            n.set(name, value);
            return n;
        }
    }
}

exports.sortImpl = function(p) {
    var n = new URLSearchParams(p);
    n.sort();
    return n;
}

exports.toStringImpl = function(p) {
    return p.toString();
}
