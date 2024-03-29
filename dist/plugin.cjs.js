'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const Shazam = core.registerPlugin('Shazam', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.ShazamWeb()),
});

class ShazamWeb extends core.WebPlugin {
    async startMatch() {
        console.error('startMatch not implemented');
    }
    async stopMatch() {
        console.error('startMatch not implemented');
    }
    async createCalendarEvent(_) {
        console.error('createCalendarEvent not implemented');
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    ShazamWeb: ShazamWeb
});

exports.Shazam = Shazam;
//# sourceMappingURL=plugin.cjs.js.map
