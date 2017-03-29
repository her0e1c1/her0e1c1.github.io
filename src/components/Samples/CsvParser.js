export const runCsvParser = (text) => {
  let size = text.length
  let line = []
  let lines = []

  function parse(index, startAt, endAt, inString, skipWs, skipWsBack) {
    if (index === size) {
        line.push(text.substring(startAt, endAt));
        lines.push(line);
        return;
    }

    var n = index + 1;
    var s0 = text[index];
    if (s0 == ' ') {
        if (skipWs) {
            parse(n, n, n, false, true, false);
            return;
        } else if (skipWsBack) {
            parse(n, startAt, endAt, false, false, true);
            return;
        }
    }

    if (inString) {
        if (s0 === '"') {
            parse(n, startAt, n-1, false, false, true);
        } else {
            parse(n, startAt, n, true, false, false);
        }
    } else {
        if (s0 === ",") {
            line.push(text.substring(startAt, endAt));
            parse(n, n, n, false, true, false);
        } else if (s0 === "\n") {
            line.push(text.substring(startAt, endAt));
            lines.push(line);
            line = [];
            parse(n, n, n, false, true, false);
        } else if (s0 === '"') {
            parse(n, n, n, true, false, false);
        } else {
            if (s0 == ' ') {
                parse(n, startAt, endAt, false, false, false);
            } else {
                parse(n, startAt, n, false, false, false);
            }
        }
    }
  }
  parse(0, 0, 0, false, true)
  return lines
}