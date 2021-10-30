import { registerPlugin } from '@capacitor/core';
const Shazam = registerPlugin('Shazam', {
    web: () => import('./web').then(m => new m.ShazamWeb()),
});
export * from './definitions';
export { Shazam };
//# sourceMappingURL=index.js.map