export interface ShazamPlugin {
    startMatch(): Promise<void>;
    stopMatch(): Promise<void>;
    createCalendarEvent(): Promise<void>;
}
