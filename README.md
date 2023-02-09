# @capacitor-community/shazam

Capacitor Shazam plugin

## Install

```bash
npm install @capacitor-community/shazam
npx cap sync
```

## API

<docgen-index>

* [`startMatch()`](#startmatch)
* [`stopMatch()`](#stopmatch)
* [`createCalendarEvent(...)`](#createcalendarevent)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### startMatch()

```typescript
startMatch() => Promise<void>
```

--------------------


### stopMatch()

```typescript
stopMatch() => Promise<void>
```

--------------------


### createCalendarEvent(...)

```typescript
createCalendarEvent(options: CalendarEventOptions) => Promise<void>
```

| Param         | Type                                                                  |
| ------------- | --------------------------------------------------------------------- |
| **`options`** | <code><a href="#calendareventoptions">CalendarEventOptions</a></code> |

--------------------


### Interfaces


#### CalendarEventOptions

| Prop            | Type                |
| --------------- | ------------------- |
| **`title`**     | <code>string</code> |
| **`location`**  | <code>string</code> |
| **`notes`**     | <code>string</code> |
| **`startDate`** | <code>string</code> |
| **`endDate`**   | <code>string</code> |

</docgen-api>
