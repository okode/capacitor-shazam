export interface ShazamMatch {
  id: string;
  title: string;
  artist: string;
}

export interface ShazamPlugin {
  startMatch(): Promise<void>;
  stopMatch(): Promise<void>;
}
