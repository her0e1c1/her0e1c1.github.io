type SignalType = "BUY" | "SELL";
const SignalTypes: SignalType[] = ["BUY", "SELL"];

type SignalKey = "macd_signal" | "rsi" | "stochastic" | "bollinger_band" | "rolling_mean";
const SignalKeys: SignalKey[] = ["macd_signal", "rsi", "stochastic", "bollinger_band", "rolling_mean"];

interface Price {
  open?: number;
  high?: number;
  low?: number;
  close?: number;
  volume: number;
  date: number; // millisecond
  code?: Code;
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

export { SignalType, Price, Signal, Code, SignalKeys, SignalTypes };
