export interface ShazamPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
