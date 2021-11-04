import { WebPlugin } from '@capacitor/core';
import type { CalendarEventOptions, ShazamPlugin } from './definitions';
export declare class ShazamWeb extends WebPlugin implements ShazamPlugin {
    startMatch(): Promise<void>;
    stopMatch(): Promise<void>;
    createCalendarEvent(_: CalendarEventOptions): Promise<void>;
}
