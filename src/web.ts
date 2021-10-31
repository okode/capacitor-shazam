import { WebPlugin } from '@capacitor/core';
import type { ShazamPlugin } from './definitions';

export class ShazamWeb extends WebPlugin implements ShazamPlugin {
  
  async startMatch(): Promise<void> {
    console.error('startMatch not implemented');
  }

  async stopMatch(): Promise<void> {
    console.error('startMatch not implemented');
  }

}
