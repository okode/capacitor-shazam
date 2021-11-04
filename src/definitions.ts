export interface CalendarEventOptions {
  title?: string;
  location?: string;
  notes?: string;
  startDate?: string;
  endDate?: string;
}

export interface ShazamPlugin {
  startMatch(): Promise<void>;
  stopMatch(): Promise<void>;
  createCalendarEvent(options: CalendarEventOptions): Promise<void>;
}
