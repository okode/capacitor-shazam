import { registerPlugin } from '@capacitor/core';

import type { ShazamPlugin } from './definitions';

const Shazam = registerPlugin<ShazamPlugin>('Shazam', {
  web: () => import('./web').then(m => new m.ShazamWeb()),
});

export * from './definitions';
export { Shazam };
