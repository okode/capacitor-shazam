var capacitorShazam = (function (exports, core) {
    'use strict';

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
        async createCalendarEvent() {
            console.error('createCalendarEvent not implemented');
        }
    }

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        ShazamWeb: ShazamWeb
    });

    exports.Shazam = Shazam;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
