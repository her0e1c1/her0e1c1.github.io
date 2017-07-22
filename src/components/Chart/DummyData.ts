import _ = require("lodash");
import * as I from "./Interface";
import moment = require("moment");

const create_price = (date?: number): I.Price => {
  return {
    open: _.random(101, 150),
    high: _.random(151, 200),
    low: _.random(1, 50),
    close: _.random(51, 100),
    volume: _.random(10 ** 3, 10 ** 6),
    date: date || 0,
    code: c0,
  };
};

const create_signal = (): I.Signal => {
  const s = I.SignalKeys
    .filter(s => !!!_.random(3)) // true becomes 1/3
    .map(s => ({ [s]: I.SignalTypes[_.random(2)] }))
    .reduce((acc, x) => Object.assign(acc, x), {});
  return {
    price: create_price(),
    score: _.random(10),
    ...s,
  };
};

const c0 = {
  code: "c0",
  database_code: "db",
  signal: {},
} as I.Code;

const prices = _.range(1, 100).reverse().map(i => create_price(moment().subtract(i, "days").toDate().getTime()));

const create_line = () => {
  return prices.map(x => [x.date, x.close! + _.random(-100, 100)] as I.Point);
};

const quandl_codes = _.range(1301, 1400).map(i => `TSE/${i}`);

const codes: I.Code[] = quandl_codes.map(code => ({
  code,
  database_code: code.split("/")[0],
  signal: create_signal(),
}));

export { codes, prices, create_line };
