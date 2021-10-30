'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const Shazam = core.registerPlugin('Shazam', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.ShazamWeb()),
});

class ShazamWeb extends core.WebPlugin {
    async echo(options) {
        console.log('ECHO', options);
        return options;
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    ShazamWeb: ShazamWeb
});

exports.Shazam = Shazam;
//# sourceMappingURL=plugin.cjs.js.map
