type SignalType = "BUY" | "SELL";
const SignalTypes: SignalType[] = ["BUY", "SELL"];

type SignalKey = "macd_signal" | "rsi" | "stochastic" | "bollinger_band" | "rolling_mean";
const SignalKeys: SignalKey[] = ["macd_signal", "rsi", "stochastic", "bollinger_band", "rolling_mean"];

type price = number;
type timepstamp = number; // millisecond

interface Price {
  open?: number;
  high?: number;
  low?: number;
  close?: number;
  volume: number;
  date: timepstamp;
  code: Code;
}

interface SignalObj {
  price?: Price; // latest
  code?: Code;
  score: number;
  // updated_at: Date;
  // created_at: Date;
}

type Signal = { [k in SignalKey]?: SignalType } & SignalObj;

interface Code {
  code: string;
  database_code: string;
  signal?: Signal;
}

type Point = [timepstamp, price];
type Line = Point[];
type OHLC = Price[];

interface Chart {
  code: string;
  ohlc?: OHLC;
  rsi?: {
    line: Line;
  };
  stochastic?: {
    k: Line;
    d: Line;
    sd: Line;
  };
  macd?: {
    line: Line;
    signal: Line;
  };
  rolling_mean?: {
    line25: Line;
    line50: Line;
    line200: Line;
  };
  bollinger_band?: {
    sigma1: Line;
    sigma2: Line;
    sigma3: Line;
    sigma1m: Line; // minus
    sigma2m: Line;
    sigma3m: Line;
  };
}

// highchart
interface Series {
  type: "line";
  data: Line;
  lineWidth: number;
  yAxis: number;
  name: string;
  color: string;
}

export { SignalType, Price, Signal, Code, SignalKeys, SignalTypes, SignalKey, Chart, Point, Line };
