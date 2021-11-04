import { WebPlugin } from '@capacitor/core';
import type { CalendarEventOptions, ShazamPlugin } from './definitions';

export class ShazamWeb extends WebPlugin implements ShazamPlugin {
  
  async startMatch(): Promise<void> {
    console.error('startMatch not implemented');
  }

  async stopMatch(): Promise<void> {
    console.error('startMatch not implemented');
  }

  async createCalendarEvent(_: CalendarEventOptions): Promise<void> {
    console.error('createCalendarEvent not implemented');
  }

}
