import * as I from "./Interface";
import _ = require("lodash");

const create_price = (): I.Price => {
  return {
    open: _.random(101, 150),
    high: _.random(151, 200),
    low: _.random(1, 50),
    close: _.random(51, 100),
    volume: _.random(10 ** 3, 10 ** 6),
    date: 100000,
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

const quandl_codes = _.range(1301, 1400).map(i => `TSE/${i}`);

const codes: I.Code[] = quandl_codes.map(code => ({
  code,
  database_code: code.split("/")[0],
  signal: create_signal(),
}));

export { codes };
