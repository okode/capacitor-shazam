import { WebPlugin } from '@capacitor/core';

import type { ShazamPlugin } from './definitions';

export class ShazamWeb extends WebPlugin implements ShazamPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
