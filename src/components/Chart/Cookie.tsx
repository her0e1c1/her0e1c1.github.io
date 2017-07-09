import Cookies = require("universal-cookie");

const cookie = new Cookies();

const getFavorites = () => {
  let f = cookie.get("favorites");
  return f || [];
};

const setFavorites = (code: string) => {
  if (!code) {
    return;
  }
  let f = getFavorites();
  !f.includes(code) && f.push(code);
  cookie.set("favorites", f);
};

const delFavorites = (code: string) => {
  if (!code) {
    return;
  }
  const f = getFavorites();
  const i = f.indexOf(code);
  if (i > -1) {
    f.splice(i, 1);
  }
  cookie.set("favorites", f);
};

export {
    getFavorites,
    setFavorites,
    delFavorites,
}