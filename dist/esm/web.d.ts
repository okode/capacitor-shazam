import { WebPlugin } from '@capacitor/core';
import type { ShazamPlugin } from './definitions';
export declare class ShazamWeb extends WebPlugin implements ShazamPlugin {
    startMatch(): Promise<void>;
    stopMatch(): Promise<void>;
}
