!function(e){function n(o){if(t[o])return t[o].exports;var r=t[o]={exports:{},id:o,loaded:!1};return e[o].call(r.exports,r,r.exports,n),r.loaded=!0,r.exports}var t={};return n.m=e,n.c=t,n.p="",n(0)}([function(e,n,t){"use strict";function o(e){return e&&e.__esModule?e:{default:e}}var r=t(2),i=o(r),a=t(4),l=o(a),u=t(7),d=document.getElementById("main"),c=i.default.createVNode;i.default.render(c(2,"div",null,u.hello),d);var f=document.createElement("div");i.default.render(c(16,l.default),f),document.head.appendChild(f);var s={"Content-Type":"application/json"},p="128.199.158.226:13309",v="",h="GET";window.fetch("http://"+p+"/"+v,{headers:s,method:h}).then(function(e){cosole.log("hi"),i.default.render(c(2,"div",null,e),d)})},function(e,n,t){(function(e){/*!
	 * inferno v1.0.5
	 * (c) 2017 Dominic Gannaway
	 * Released under the MIT License.
	 */
!function(e,t){t(n)}(this,function(n){"use strict";function t(e){return!s(e.prototype)&&!s(e.prototype.render)}function o(e){return u(e)||d(e)}function r(e){return s(e)||c(e)}function i(e){return c(e)||e===!1||f(e)||s(e)}function a(e){return"function"==typeof e}function l(e){return"o"===e[0]&&"n"===e[1]&&e.length>3}function u(e){return"string"==typeof e}function d(e){return"number"==typeof e}function c(e){return null===e}function f(e){return e===!0}function s(e){return void 0===e}function p(e){return"object"==typeof e}function v(e){throw e||(e=vn),new Error("Inferno Error: "+e)}function h(e,n){e||console.error(n)}function m(e,n){return c(n.key)&&(n.key="."+e),n}function g(e,n,t,r){for(;t<e.length;t++){var a=e[t];i(a)?r++:mn(a)?r=g(a,n,0,r):(o(a)?a=S(a):x(a)&&a.dom&&(a=E(a)),n.push(m(r++,a)))}return r}function y(e){var n,t=0;e.$?e=e.slice():e.$=!0;for(var r=0;r<e.length;r++){var a=e[r];if(t++,i(a)||mn(a)){var l=(n||e).slice(0,r);return t=g(e,l,r,t),l}o(a)?(n||(n=e.slice(0,r)),n.push(m(t,S(a)))):x(a)&&a.dom||c(a.key)&&!(64&a.flags)?(n||(n=e.slice(0,r)),n.push(m(t,E(a)))):n&&n.push(m(t,E(a)))}return n||e}function _(e){return mn(e)?y(e):x(e)&&e.dom?E(e):e}function b(e,n,t){28&e.flags||!r(t)||r(n.children)||(e.children=n.children),n.ref&&(e.ref=n.ref,delete n.ref),n.events&&(e.events=n.events),r(n.key)||(e.key=n.key,delete n.key)}function N(e,n){for(var t in e)s(n[t])&&(n[t]=e[t])}function k(e,n){"svg"===e?n.flags=128:"input"===e?n.flags=512:"select"===e?n.flags=2048:"textarea"===e?n.flags=1024:"media"===e?n.flags=256:n.flags=2}function O(e){var n=e.props,t=!c(n),o=e.type,r=e.children;u(o)&&28&e.flags&&(k(o,e),t&&n.children&&(e.children=n.children,r=n.children)),t&&b(e,n,r),i(r)||(e.children=_(r)),t&&!i(n.children)&&(n.children=_(n.children))}function w(e,n,o,r,i,a,l,u){16&e&&(e=t(n)?4:8);var d={children:s(r)?null:r,dom:null,events:i||null,flags:e,key:s(a)?null:a,props:o||null,ref:l||null,type:n};return u||O(d),yn.createVNode&&yn.createVNode(d),d}function E(e,n){for(var t=[],o=arguments.length-2;o-- >0;)t[o]=arguments[o+2];var a=t;t.length>0&&!c(t[0])&&(n||(n={}),1===t.length&&(a=t[0]),s(n.children)?n.children=a:mn(a)?mn(n.children)?n.children=n.children.concat(a):n.children=[n.children].concat(a):mn(n.children)?n.children.push(a):(n.children=[n.children],n.children.push(a))),a=null;var l;if(mn(e)){for(var u=[],d=0;d<e.length;d++)u.push(E(e[d]));l=u}else{var f=e.flags,p=e.events||n&&n.events||null,v=r(e.key)?n?n.key:null:e.key,h=e.ref||(n?n.ref:null);if(28&f){l=w(f,e.type,Object.assign({},e.props,n),null,p,v,h,!0);var m=l.props;if(m){var g=m.children;if(g)if(mn(g))for(var y=0;y<g.length;y++){var _=g[y];!i(_)&&x(_)&&(m.children[y]=E(_))}else x(g)&&(m.children=E(g))}l.children=null}else 3970&f?(a=n&&n.children||e.children,l=w(f,e.type,Object.assign({},e.props,n),a,p,v,h,!a)):1&f&&(l=S(e.children))}return l}function C(){return w(4096)}function S(e){return w(1,null,null,e,null,null,null,!0)}function x(e){return!!e.flags}function U(e,n,t){e.split(",").forEach(function(e){return n[e]=t})}function M(e,n,t){return n+"-"+t.toLowerCase()}function V(e,n,t,o){var r=Vn.get(e);if(t){if(!r){r={items:new Map,count:0,docEvent:null};var i=I(e,r);r.docEvent=i,Vn.set(e,r)}n||r.count++,r.items.set(o,t)}else r&&r.items.has(o)&&(r.count--,r.items.delete(o),0===r.count&&(document.removeEventListener(T(e),r.docEvent),Vn.delete(e)))}function D(e,n,t,o,r){var i=t.get(n);if(!i||(o--,r.dom=n,i.event?i.event(i.data,e):i(e),!r.stopPropagation)){var a=n.parentNode;o>0&&(a||a===document.body)&&D(e,a,t,o,r)}}function T(e){return e.substr(2).toLowerCase()}function I(e,n){var t=function(e){var t={stopPropagation:!1,dom:document};Object.defineProperty(e,"currentTarget",{configurable:!0,get:function(){return t.dom}}),e.stopPropagation=function(){t.stopPropagation=!0};var o=n.count;o>0&&D(e,e.target,n.items,o,t)};return document.addEventListener(T(e),t),t}function P(e){return"checkbox"===e||"radio"===e}function j(e){var n=P(e.type);return n?!r(e.checked):!r(e.value)}function W(e){var n=this.vNode,t=n.events||gn,o=n.dom;if(t.onInput){var r=t.onInput;r.event?r.event(r.data,e):r(e)}else t.oninput&&t.oninput(e);Y(this.vNode,o)}function R(e){var n=this.vNode,t=n.events||gn,o=t.onChange;o.event?o.event(o.data,e):o(e)}function A(e){var n=this.vNode,t=n.events||gn,o=n.dom;if(t.onClick){var r=t.onClick;r.event?r.event(r.data,e):r(e)}else t.onclick&&t.onclick(e);Y(this.vNode,o)}function L(e){var n=document.querySelectorAll('input[type="radio"][name="'+e+'"]');[].forEach.call(n,function(e){var n=Dn.get(e);if(n){var t=n.vNode.props;t&&(e.checked=n.vNode.props.checked)}})}function B(e,n){var t=e.props||gn;if(Y(e,n),j(t)){var o=Dn.get(n);o||(o={vNode:e},P(t.type)?(n.onclick=A.bind(o),n.onclick.wrapped=!0):(n.oninput=W.bind(o),n.oninput.wrapped=!0),t.onChange&&(n.onchange=R.bind(o),n.onchange.wrapped=!0),Dn.set(n,o)),o.vNode=e}}function Y(e,n){var t=e.props||gn,o=t.type,i=t.value,a=t.checked,l=t.multiple;o&&o!==n.type&&(n.type=o),l&&l!==n.multiple&&(n.multiple=l),P(o)?(r(i)||(n.value=i),n.checked=a,"radio"===o&&t.name&&L(t.name)):r(i)||n.value===i?r(a)||(n.checked=a):n.value=i}function K(e){return!r(e.value)}function G(e,n){var t=e.type;if("optgroup"===t){var o=e.children;if(mn(o))for(var r=0;r<o.length;r++)F(o[r],n);else x(o)&&F(o,n)}else F(e,n)}function F(e,n){var t=e.props||gn,o=e.dom;o.value=t.value,mn(n)&&n.indexOf(t.value)!==-1||t.value===n?o.selected=!0:o.selected=t.selected||!1}function H(e){var n=this.vNode,t=n.events||gn,o=n.dom;if(t.onChange){var r=t.onChange;r.event?r.event(r.data,e):r(e)}else t.onchange&&t.onchange(e);z(this.vNode,o)}function J(e,n){var t=e.props||gn;if(z(e,n),K(t)){var o=Dn.get(n);o||(o={vNode:e},n.onchange=H.bind(o),n.onchange.wrapped=!0,Dn.set(n,o)),o.vNode=e}}function z(e,n){var t=e.props||gn;t.multiple!==n.multiple&&(n.multiple=t.multiple);var o=e.children,r=t.value;if(mn(o))for(var i=0;i<o.length;i++)G(o[i],r);else x(o)&&G(o,r)}function q(e){return!r(e.value)}function $(e){var n=this.vNode,t=n.events||gn,o=t.onChange;o.event?o.event(o.data,e):o(e)}function X(e){var n=this.vNode,t=n.events||gn,o=n.dom;if(t.onInput){var r=t.onInput;r.event?r.event(r.data,e):r(e)}else t.oninput&&t.oninput(e);Q(this.vNode,o)}function Z(e,n){var t=e.props||gn;Q(e,n);var o=Dn.get(n);q(t)&&(o||(o={vNode:e},n.oninput=X.bind(o),n.oninput.wrapped=!0,t.onChange&&(n.onchange=$.bind(o),n.onchange.wrapped=!0),Dn.set(n,o)),o.vNode=e)}function Q(e,n){var t=e.props||gn,o=t.value;n.value!==o&&(r(o)||(n.value=o))}function ee(e,n,t){512&e?B(n,t):2048&e?J(n,t):1024&e&&Z(n,t)}function ne(e,n,t,o,r,i){var a=e.flags;28&a?oe(e,n,t,o,r,i):3970&a?re(e,n,t,o,r,i):4097&a&&te(e,n)}function te(e,n){n&&Je(n,e.dom)}function oe(e,n,t,o,i,a){var l=e.children,u=e.flags,d=4&u,c=e.ref,f=e.dom;if(!a&&(d?(l._ignoreSetState=!0,yn.beforeUnmount&&yn.beforeUnmount(e),l.componentWillUnmount&&l.componentWillUnmount(),c&&!a&&c(null),l._unmounted=!0,yn.findDOMNodeEnabled&&jn.delete(l)):r(c)||r(c.onComponentWillUnmount)||c.onComponentWillUnmount(f),!i))if(d){var s=l._lifecycle;s.fastUnmount||ne(l._lastInput,null,s,!1,i,a)}else t.fastUnmount||ne(l,null,t,!1,i,a);if(n){var p=l._lastInput;r(p)&&(p=l),Je(n,f)}yn.recyclingEnabled&&!d&&(n||o)&&Ce(e)}function re(e,n,t,o,i,a){var l=e.dom,u=e.ref,d=e.events;if(!i&&!t.fastUnmount){u&&!a&&ae(u);var f=e.children;r(f)||ie(f,t,i,a)}if(!c(d))for(var s in d)_e(s,d[s],null,l,t),d[s]=null;n&&Je(n,l),yn.recyclingEnabled&&(n||o)&&we(e)}function ie(e,n,t,o){if(mn(e))for(var r=0;r<e.length;r++){var a=e[r];!i(a)&&p(a)&&ne(a,null,n,!1,t,o)}else p(e)&&ne(e,null,n,!1,t,o)}function ae(n){if(a(n))n(null);else{if(i(n))return;"production"!==e.env.NODE_ENV&&v('string "refs" are not supported in Inferno 1.0. Use callback "refs" instead.'),v()}}function le(e,n,t,o,r,i,a){if(e!==n){var l=e.flags,u=n.flags;28&u?28&l?fe(e,n,t,o,r,i,4&u,a):Re(t,De(n,null,o,r,i,4&u),e,o,a):3970&u?3970&l?de(e,n,t,o,r,i,a):Re(t,Me(n,null,o,r,i),e,o,a):1&u?1&l?se(e,n):Re(t,xe(n,null),e,o,a):4096&u?4096&l?pe(e,n):Re(t,Ue(n,null),e,o,a):We(e,n,t,o,r,i,a)}}function ue(e,n,t,o){x(e)?ne(e,n,t,!0,!1,o):mn(e)?ze(n,e,t,!1,o):n.textContent=""}function de(e,n,t,o,r,i,a){var l=n.type,u=e.type;if(u!==l)Fe(e,n,t,o,r,i,a);else{var d=e.dom,c=e.props,f=n.props,s=e.children,p=n.children,v=e.flags,h=n.flags,m=e.ref,g=n.ref,y=e.events,_=n.events;n.dom=d,(i||128&h)&&(i=!0),s!==p&&ce(v,h,s,p,d,o,r,i,a),2&h||ee(h,n,d),c!==f&&be(c,f,d,o,r,i),y!==_&&ye(y,_,d,o),g&&(m!==g||a)&&Pe(d,g,o)}}function ce(e,n,t,r,a,l,u,d,c){var f=!1,s=!1;64&n?f=!0:32&e&&32&n?(s=!0,f=!0):i(r)?ue(t,a,l,c):i(t)?o(r)?Le(a,r):mn(r)?Ve(r,a,l,u,d):Se(r,a,l,u,d):o(r)?o(t)?Be(a,r):(ue(t,a,l,c),Le(a,r)):mn(r)?mn(t)?(f=!0,$e(t,r)&&(s=!0)):(ue(t,a,l,c),Ve(r,a,l,u,d)):mn(t)?(ze(a,t,l,!1,c),Se(r,a,l,u,d)):x(r)?x(t)?le(t,r,a,l,u,d,c):(ue(t,a,l,c),Se(r,a,l,u,d)):x(t),f&&(s?he(t,r,a,l,u,d,c):ve(t,r,a,l,u,d,c))}function fe(n,t,a,l,u,d,f,h){var m=n.type,g=t.type,y=t.props||gn,_=n.key,b=t.key,k=g.defaultProps;if(s(k)||(N(k,y),t.props=y),m!==g)if(f)Fe(n,t,a,l,u,d,h);else{var O=n.children._lastInput||n.children,w=Ae(t,g,y,u);le(O,w,a,l,u,d,h);var x=t.dom=w.dom;t.children=w,Ie(t.ref,x,l),ne(n,null,l,!1,!0,h)}else if(f){if(_!==b)return Fe(n,t,a,l,u,d,h),!1;var U=n.children;if(U._unmounted){if(c(a))return!0;He(a,De(t,null,l,u,d,4&t.flags),n.dom)}else{var M=U.state,V=U.state,D=U.props,T=U.getChildContext();t.children=U,U._isSVG=d,T=r(T)?u:Object.assign({},u,T);var I=U._lastInput,P=U._updateComponent(M,V,D,y,u,!1,!1),j=!0;if(U._childContext=T,i(P)?P=C():P===pn?(P=I,j=!1):o(P)?P=S(P):mn(P)?("production"!==e.env.NODE_ENV&&v("a valid Inferno VNode (or null) must be returned from a component render. You may have returned an array or an invalid object."),v()):p(P)&&P.dom&&(P=E(P)),28&P.flags?P.parentVNode=t:28&I.flags&&(I.parentVNode=t),U._lastInput=P,U._vNode=t,j){var W=l.fastUnmount,R=U._lifecycle;l.fastUnmount=R.fastUnmount,le(I,P,a,l,T,d,h),R.fastUnmount=l.fastUnmount,l.fastUnmount=W,U.componentDidUpdate(D,M),yn.afterUpdate&&yn.afterUpdate(t),yn.findDOMNodeEnabled&&jn.set(U,P.dom)}t.dom=P.dom}}else{var A=!0,L=n.props,B=t.ref,Y=!r(B),K=n.children,G=K;t.dom=n.dom,t.children=K,_!==b?A=!0:Y&&!r(B.onComponentShouldUpdate)&&(A=B.onComponentShouldUpdate(L,y)),A!==!1&&(Y&&!r(B.onComponentWillUpdate)&&B.onComponentWillUpdate(L,y),G=g(y,u),i(G)?G=C():o(G)&&G!==pn?G=S(G):mn(G)?("production"!==e.env.NODE_ENV&&v("a valid Inferno VNode (or null) must be returned from a component render. You may have returned an array or an invalid object."),v()):p(G)&&G.dom&&(G=E(G)),G!==pn&&(le(K,G,a,l,u,d,h),t.children=G,Y&&!r(B.onComponentDidUpdate)&&B.onComponentDidUpdate(L,y),t.dom=G.dom)),28&G.flags?G.parentVNode=t:28&K.flags&&(K.parentVNode=t)}return!1}function se(e,n){var t=n.children,o=e.dom;n.dom=o,e.children!==t&&(o.nodeValue=t)}function pe(e,n){n.dom=e.dom}function ve(e,n,t,o,r,i,a){for(var l=e.length,u=n.length,d=l>u?u:l,c=0;c<d;c++){var f=n[c];f.dom&&(f=n[c]=E(f)),le(e[c],f,t,o,r,i,a)}if(l<u)for(c=d;c<u;c++){var s=n[c];s.dom&&(s=n[c]=E(s)),Ye(t,Se(s,null,o,r,i))}else if(0===u)ze(t,e,o,!1,a);else if(l>u)for(c=d;c<l;c++)ne(e[c],t,o,!1,!1,a)}function he(e,n,t,o,r,i,a){var l,u,d,f,p,v,h,m=e.length,g=n.length,y=m-1,_=g-1,b=0,N=0;if(0===m)return void(0!==g&&Ve(n,t,o,r,i));if(0===g)return void ze(t,e,o,!1,a);var k=e[b],O=n[N],w=e[y],C=n[_];O.dom&&(n[N]=O=E(O)),C.dom&&(n[_]=C=E(C));e:for(;;){for(;k.key===O.key;){if(le(k,O,t,o,r,i,a),b++,N++,b>y||N>_)break e;k=e[b],O=n[N],O.dom&&(n[N]=O=E(O))}for(;w.key===C.key;){if(le(w,C,t,o,r,i,a),y--,_--,b>y||N>_)break e;w=e[y],C=n[_],C.dom&&(n[_]=C=E(C))}if(w.key!==O.key){if(k.key!==C.key)break;le(k,C,t,o,r,i,a),v=_+1,p=v<n.length?n[v].dom:null,Ke(t,C.dom,p),b++,_--,k=e[b],C=n[_],C.dom&&(n[_]=C=E(C))}else le(w,O,t,o,r,i,a),Ke(t,O.dom,k.dom),y--,N++,w=e[y],O=n[N],O.dom&&(n[N]=O=E(O))}if(b>y){if(N<=_)for(v=_+1,p=v<n.length?n[v].dom:null;N<=_;)h=n[N],h.dom&&(n[N]=h=E(h)),N++,Ke(t,Se(h,null,o,r,i),p)}else if(N>_)for(;b<=y;)ne(e[b++],t,o,!1,!1,a);else{m=y-b+1,g=_-N+1;var S=e,x=new Array(g);for(l=0;l<g;l++)x[l]=-1;var U=!1,M=0,V=0;if(g<=4||m*g<=16){for(l=b;l<=y;l++)if(d=e[l],V<g)for(u=N;u<=_;u++)if(f=n[u],d.key===f.key){x[u-N]=l,M>u?U=!0:M=u,f.dom&&(n[u]=f=E(f)),le(d,f,t,o,r,i,a),V++,S[l]=null;break}}else{var D=new Map;for(l=N;l<=_;l++)h=n[l],D.set(h.key,l);for(l=b;l<=y;l++)d=e[l],V<g&&(u=D.get(d.key),s(u)||(f=n[u],x[u-N]=l,M>u?U=!0:M=u,f.dom&&(n[u]=f=E(f)),le(d,f,t,o,r,i,a),V++,S[l]=null))}if(m===e.length&&0===V)for(ze(t,e,o,!1,a);N<g;)h=n[N],h.dom&&(n[N]=h=E(h)),N++,Ke(t,Se(h,null,o,r,i),null);else{for(l=m-V;l>0;)d=S[b++],c(d)||(ne(d,t,o,!0,!1,a),l--);if(U){var T=me(x);for(u=T.length-1,l=g-1;l>=0;l--)x[l]===-1?(M=l+N,h=n[M],h.dom&&(n[M]=h=E(h)),v=M+1,p=v<n.length?n[v].dom:null,Ke(t,Se(h,t,o,r,i),p)):u<0||l!==T[u]?(M=l+N,h=n[M],v=M+1,p=v<n.length?n[v].dom:null,Ke(t,h.dom,p)):u--}else if(V!==g)for(l=g-1;l>=0;l--)x[l]===-1&&(M=l+N,h=n[M],h.dom&&(n[M]=h=E(h)),v=M+1,p=v<n.length?n[v].dom:null,Ke(t,Se(h,null,o,r,i),p))}}}function me(e){var n=e.slice(0),t=[];t.push(0);var o,r,i,a,l;for(o=0;o<e.length;o++)if(e[o]!==-1)if(r=t[t.length-1],e[r]<e[o])n[o]=r,t.push(o);else{for(i=0,a=t.length-1;i<a;)l=(i+a)/2|0,e[t[l]]<e[o]?i=l+1:a=l;e[o]<e[t[i]]&&(i>0&&(n[o]=t[i-1]),t[i]=o)}for(i=t.length,a=t[i-1];i-- >0;)t[i]=a,a=n[a];return t}function ge(e,n,t,o,i,a){if(!Sn[e])if(wn[e])o[e]=!!t;else if(On[e]){var u=r(t)?"":t;o[e]!==u&&(o[e]=u)}else if(n!==t)if(l(e))_e(e,n,t,o,a);else if(r(t))o.removeAttribute(e);else if("className"===e)i?o.setAttribute("class",t):o.className=t;else if("style"===e)Ne(n,t,o);else if("dangerouslySetInnerHTML"===e){var d=n&&n.__html,c=t&&t.__html;d!==c&&(r(c)||(o.innerHTML=c))}else if("childrenType"!==e&&"ref"!==e&&"key"!==e){var f;xn[e]?f=xn[e]:i&&e.match(Un)?(f=e.replace(/([a-z])([A-Z]|1)/g,M),xn[e]=f):f=e;var s=En[e];s?o.setAttributeNS(s,f,t):o.setAttribute(f,t)}}function ye(e,n,t,o){if(e=e||gn,n=n||gn,n!==gn)for(var i in n)_e(i,e[i],n[i],t,o);if(e!==gn)for(var a in e)r(n[a])&&_e(a,e[a],null,t,o)}function _e(n,t,o,i,l){if(t!==o){var u=n.toLowerCase(),d=i[u];if(d&&d.wrapped)return;if(Mn[n])V(n,t,o,i);else if(t!==o)if(a(o)||r(o))i[u]=o;else{var c=o.event;c&&a(c)?(i._data||(i[u]=function(e){c(e.currentTarget._data,e)}),i._data=o.data):("production"!==e.env.NODE_ENV&&v('an event on a VNode "'+n+'". was not a function or a valid linkEvent.'),v())}}}function be(e,n,t,o,i,a){if(e=e||gn,n=n||gn,n!==gn)for(var l in n){var u=n[l],d=e[l];r(u)?ke(l,u,t):ge(l,d,u,t,a,o)}if(e!==gn)for(var c in e)r(n[c])&&ke(c,e[c],t)}function Ne(e,n,t){if(u(n))return void(t.style.cssText=n);for(var o in n){var i=n[o];d(i)&&!Cn[o]?t.style[o]=i+"px":t.style[o]=i}if(!r(e))for(var a in e)r(n[a])&&(t.style[a]="")}function ke(e,n,t){"className"===e?t.removeAttribute("class"):"value"===e?t.value="":"style"===e?t.removeAttribute("style"):l(e)?V(name,n,null,t):t.removeAttribute(e)}function Oe(e,n,t,o){var r=e.type,i=e.key,a=In.get(r);if(!s(a)){var l=null===i?a.nonKeyed:a.keyed.get(i);if(!s(l)){var u=l.pop();if(!s(u))return de(u,e,null,n,t,o,!0),e.dom}}return null}function we(e){var n=e.type,t=e.key,o=In.get(n);if(s(o)&&(o={nonKeyed:[],keyed:new Map},In.set(n,o)),c(t))o.nonKeyed.push(e);else{var r=o.keyed.get(t);s(r)&&(r=[],o.keyed.set(t,r)),r.push(e)}}function Ee(e,n,t,o){var r=e.type,i=e.key,a=Tn.get(r);if(!s(a)){var l=null===i?a.nonKeyed:a.keyed.get(i);if(!s(l)){var u=l.pop();if(!s(u)){var d=e.flags,c=fe(u,e,null,n,t,o,4&d,!0);if(!c)return e.dom}}}return null}function Ce(e){var n=e.type,t=e.key,o=e.ref,r=o&&(o.onComponentWillMount||o.onComponentWillUnmount||o.onComponentDidMount||o.onComponentWillUpdate||o.onComponentDidUpdate);if(!r){var i=Tn.get(n);if(s(i)&&(i={nonKeyed:[],keyed:new Map},Tn.set(n,i)),c(t))i.nonKeyed.push(e);else{var a=i.keyed.get(t);s(a)&&(a=[],i.keyed.set(t,a)),a.push(e)}}}function Se(n,t,o,r,i){var a=n.flags;return 3970&a?Me(n,t,o,r,i):28&a?De(n,t,o,r,i,4&a):4096&a?Ue(n,t):1&a?xe(n,t):("production"!==e.env.NODE_ENV&&v("object"==typeof n?"mount() received an object that's not a valid VNode, you should stringify it first. Object: \""+JSON.stringify(n)+'".':'mount() expects a valid VNode, instead it received an object with the type "'+typeof n+'".'),void v())}function xe(e,n){var t=document.createTextNode(e.children);return e.dom=t,n&&Ye(n,t),t}function Ue(e,n){var t=document.createTextNode("");return e.dom=t,n&&Ye(n,t),t}function Me(e,n,t,r,i){if(yn.recyclingEnabled){var a=Oe(e,t,r,i);if(!c(a))return c(n)||Ye(n,a),a}var l=e.type,u=e.flags;(i||128&u)&&(i=!0);var d=Ge(l,i),f=e.children,s=e.props,p=e.events,v=e.ref;if(e.dom=d,c(f)||(o(f)?Le(d,f):mn(f)?Ve(f,d,t,r,i):x(f)&&Se(f,d,t,r,i)),2&u||ee(u,e,d),!c(s))for(var h in s)ge(h,null,s[h],d,i,t);if(!c(p))for(var m in p)_e(m,null,p[m],d,t);return c(v)||Pe(d,v,t),c(n)||Ye(n,d),d}function Ve(e,n,t,o,r){for(var a=0;a<e.length;a++){var l=e[a];i(l)||(l.dom&&(e[a]=l=E(l)),Se(e[a],n,t,o,r))}}function De(e,n,t,o,r,i){if(yn.recyclingEnabled){var a=Ee(e,t,o,r);if(!c(a))return c(n)||Ye(n,a),a}var l,u=e.type,d=e.props||gn,f=u.defaultProps,p=e.ref;if(s(f)||(N(f,d),e.props=d),i){var v=je(e,u,d,o,r),h=v._lastInput,m=t.fastUnmount;t.fastUnmount=!0,v._vNode=e,e.dom=l=Se(h,null,t,v._childContext,r);var g=v._lifecycle=new _n;g.fastUnmount=s(v.componentWillUnmount)&&t.fastUnmount,t.fastUnmount=m&&g.fastUnmount,c(n)||Ye(n,l),Te(e,p,v,t),yn.findDOMNodeEnabled&&jn.set(v,l),e.children=v}else{var y=Ae(e,u,d,o);e.dom=l=Se(y,null,t,o,r),e.children=y,Ie(p,l,t),c(n)||Ye(n,l)}return l}function Te(n,t,r,i){t&&(a(t)?t(r):("production"!==e.env.NODE_ENV&&v(o(t)?'string "refs" are not supported in Inferno 1.0. Use callback "refs" instead.':p(t)&&4&n.flags?"functional component lifecycle events are not supported on ES2015 class components.":'a bad value for "ref" was used on component: "'+JSON.stringify(t)+'"'),v()));var l=r.componentDidMount,u=yn.afterMount;s(l)&&c(u)||i.addListener(function(){u&&u(n),l&&r.componentDidMount()})}function Ie(e,n,t){e&&(r(e.onComponentWillMount)||e.onComponentWillMount(),r(e.onComponentDidMount)||t.addListener(function(){return e.onComponentDidMount(n)}),r(e.onComponentWillUnmount)||(t.fastUnmount=!1))}function Pe(n,t,o){if(a(t))o.fastUnmount=!1,o.addListener(function(){return t(n)});else{if(i(t))return;"production"!==e.env.NODE_ENV&&v('string "refs" are not supported in Inferno 1.0. Use callback "refs" instead.'),v()}}function je(n,t,a,l,u){s(l)&&(l={});var d=new t(a,l);d.context=l,d.props===gn&&(d.props=a),d._patch=le,yn.findDOMNodeEnabled&&(d._componentToDOMNodeMap=jn),d._unmounted=!1,d._pendingSetState=!0,d._isSVG=u,d.componentWillMount();var c=d.getChildContext();r(c)?d._childContext=l:d._childContext=Object.assign({},l,c),yn.beforeRender&&yn.beforeRender(d);var f=d.render(a,d.state,l);return yn.afterRender&&yn.afterRender(d),mn(f)?("production"!==e.env.NODE_ENV&&v("a valid Inferno VNode (or null) must be returned from a component render. You may have returned an array or an invalid object."),v()):i(f)?f=C():o(f)?f=S(f):(f.dom&&(f=E(f)),28&f.flags&&(f.parentVNode=n)),d._pendingSetState=!1,d._lastInput=f,d}function We(e,n,t,o,r,i,a){Re(t,Se(n,null,o,r,i),e,o,a)}function Re(e,n,t,o,r){var i=!1;28&t.flags&&(ne(t,null,o,!1,!1,r),t=t.children._lastInput||t.children,i=!0),He(e,n,t.dom),ne(t,null,o,!1,i,r)}function Ae(n,t,r,a){var l=t(r,a);return mn(l)?("production"!==e.env.NODE_ENV&&v("a valid Inferno VNode (or null) must be returned from a component render. You may have returned an array or an invalid object."),v()):i(l)?l=C():o(l)?l=S(l):(l.dom&&(l=E(l)),28&l.flags&&(l.parentVNode=n)),l}function Le(e,n){""!==n?e.textContent=n:e.appendChild(document.createTextNode(""))}function Be(e,n){e.firstChild.nodeValue=n}function Ye(e,n){e.appendChild(n)}function Ke(e,n,t){r(t)?Ye(e,n):e.insertBefore(n,t)}function Ge(e,n){return n===!0?document.createElementNS(kn,e):document.createElement(e)}function Fe(e,n,t,o,r,i,a){ne(e,null,o,!1,!1,a);var l=Se(n,null,o,r,i);n.dom=l,He(t,l,e.dom)}function He(e,n,t){e||(e=t.parentNode),e.replaceChild(n,t)}function Je(e,n){e.removeChild(n)}function ze(e,n,t,o,r){e.textContent="",(!t.fastUnmount||t.fastUnmount&&yn.recyclingEnabled&&!r&&!o)&&qe(null,n,t,o,r)}function qe(e,n,t,o,r){for(var a=0;a<n.length;a++){var l=n[a];i(l)||ne(l,e,t,!0,o,r)}}function $e(e,n){return n.length&&!r(n[0])&&!r(n[0].key)&&e.length&&!r(e[0])&&!r(e[0].key)}function Xe(e){for(var n=e.childNodes,t=n.length,o=0;o<t;){var r=n[o];if(8===r.nodeType)if("!"===r.data){var i=document.createTextNode("");e.replaceChild(i,r),o++}else e.removeChild(r),t--;else o++}}function Ze(e,n,t,o,r,i){var a=e.type,l=e.props||gn,u=e.ref;if(e.dom=n,i){var d=n.namespaceURI===kn,c=a.defaultProps;s(c)||(N(c,l),e.props=l);var f=je(e,a,l,o,d),p=t.fastUnmount,v=f._lastInput;t.fastUnmount=!0,f._vComponent=e,f._vNode=e,on(v,n,t,f._childContext,d);var h=f._lifecycle=new _n;h.fastUnmount=s(f.componentWillUnmount)&&t.fastUnmount,t.fastUnmount=p&&h.fastUnmount,Te(e,u,f,t),yn.findDOMNodeEnabled&&jn.set(f,n),e.children=f}else{var m=Ae(e,a,l,o);on(m,n,t,o,r),e.children=m,e.dom=m.dom,Ie(u,n,t)}}function Qe(e,n,t,o,r){var i=e.type,a=e.children,l=e.props,u=e.events,d=e.flags,c=e.ref;if((r||128&d)&&(r=!0),1!==n.nodeType||n.tagName.toLowerCase()!==i){var f=Me(e,null,t,o,r);e.dom=f,He(n.parentNode,f,n)}else{if(e.dom=n,a&&en(a,n,t,o,r),2&d||ee(d,e,n),l)for(var s in l)ge(s,null,l[s],n,r,t);if(u)for(var p in u)_e(p,null,u[p],n,t);c&&Pe(n,c,t)}}function en(e,n,t,o,r){Xe(n);var i=Array.prototype.slice.call(n.childNodes),a=0;if(mn(e))for(var l=0;l<e.length;l++){var u=e[l];if(p(u)&&!c(u)){var d=i[a++];d?on(u,d,t,o,r):Se(u,n,t,o,r)}}else p(e)&&on(e,n.firstChild,t,o,r)}function nn(e,n){if(3===n.nodeType){var t=xe(e,null);e.dom=t,He(n.parentNode,t,n)}else e.dom=n}function tn(e,n){e.dom=n}function on(n,t,o,r,a){"production"!==e.env.NODE_ENV&&i(t)&&v("failed to hydrate. The server-side render doesn't match client side.");var l=n.flags;return 28&l?Ze(n,t,o,r,a,4&l):3970&l?Qe(n,t,o,r,a):1&l?nn(n,t):4096&l?tn(n,t):("production"!==e.env.NODE_ENV&&v('hydrate() expects a valid VNode, instead it received an object with the type "'+typeof n+'".'),void v())}function rn(e,n,t){return!(!n||1!==n.nodeType||!n.firstChild)&&(on(e,n.firstChild,t,{},!1),!0)}function an(n){yn.findDOMNodeEnabled||("production"!==e.env.NODE_ENV&&v("findDOMNode() has been disabled, use enableFindDOMNode() enabled findDOMNode(). Warning this can significantly impact performance!"),v());var t=n&&n.nodeType?n:null;return jn.get(n)||t}function ln(e){for(var n=0;n<Pn.length;n++){var t=Pn[n];if(t.dom===e)return t}return null}function un(e,n,t){var o={dom:e,input:n,lifecycle:t};return Pn.push(o),o}function dn(e){for(var n=0;n<Pn.length;n++)if(Pn[n]===e)return void Pn.splice(n,1)}function cn(n,t){if(Wn===t&&("production"!==e.env.NODE_ENV&&v('you cannot render() to the "document.body". Use an empty element as a container instead.'),v()),n!==pn){var o=ln(t);if(c(o)){var a=new _n;i(n)||(n.dom&&(n=E(n)),rn(n,t,a)||Se(n,t,a,{},!1),o=un(t,n,a),a.trigger())}else{var l=o.lifecycle;l.listeners=[],r(n)?(ne(o.input,t,l,!1,!1,!1),dn(o)):(n.dom&&(n=E(n)),le(o.input,n,t,l,{},!1,!1)),l.trigger(),o.input=n}if(o){var u=o.input;if(u&&28&u.flags)return u.children}}}function fn(e){var n=e||null;return function(e,t){n||(n=e),cn(t,n)}}function sn(e,n){return{data:e,event:n}}var pn="$NO_OP",vn="a runtime error occured! Use Inferno in development environment to find the error.",hn="undefined"!=typeof window&&window.document,mn=Array.isArray,gn={},yn={recyclingEnabled:!0,findDOMNodeEnabled:!1,roots:null,createVNode:null,beforeRender:null,afterRender:null,afterMount:null,afterUpdate:null,beforeUnmount:null},_n=function(){this.listeners=[],this.fastUnmount=!0};_n.prototype.addListener=function(e){this.listeners.push(e)},_n.prototype.trigger=function(){for(var e=this,n=0;n<this.listeners.length;n++)e.listeners[n]()};var bn="http://www.w3.org/1999/xlink",Nn="http://www.w3.org/XML/1998/namespace",kn="http://www.w3.org/2000/svg",On={},wn={},En={},Cn={},Sn={},xn={httpEquiv:"http-equiv",acceptCharset:"accept-charset"},Un=/^(accentH|arabicF|capH|font[FSVW]|glyph[NO]|horiz[AO]|panose1|renderingI|strikethrough[PT]|underline[PT]|v[AHIM]|vert[AO]|xH|alignmentB|baselineS|clip[PR]|color[IPR]|dominantB|enableB|fill[OR]|flood[COF]|imageR|letterS|lightingC|marker[EMS]|pointerE|shapeR|stop[CO]|stroke[DLMOW]|text[ADR]|unicodeB|wordS|writingM).*/,Mn={};U("xlink:href,xlink:arcrole,xlink:actuate,xlink:role,xlink:titlef,xlink:type",En,bn),U("xml:base,xml:lang,xml:space",En,Nn),U("volume,defaultValue,defaultChecked",On,!0),U("children,ref,key,selected,checked,value,multiple",Sn,!0),U("onClick,onMouseDown,onMouseUp,onMouseMove,onSubmit,onDblClick,onKeyDown,onKeyUp,onKeyPress",Mn,!0),U("muted,scoped,loop,open,checked,default,capture,disabled,readOnly,required,autoplay,controls,seamless,reversed,allowfullscreen,novalidate",wn,!0),U("animationIterationCount,borderImageOutset,borderImageSlice,borderImageWidth,boxFlex,boxFlexGroup,boxOrdinalGroup,columnCount,flex,flexGrow,flexPositive,flexShrink,flexNegative,flexOrder,gridRow,gridColumn,fontWeight,lineClamp,lineHeight,opacity,order,orphans,tabSize,widows,zIndex,zoom,fillOpacity,floodOpacity,stopOpacity,strokeDasharray,strokeDashoffset,strokeMiterlimit,strokeOpacity,strokeWidth,",Cn,!0);var Vn=new Map,Dn=new Map,Tn=new Map,In=new Map,Pn=[],jn=new Map;yn.roots=Pn;var Wn=hn?document.body:null;if("production"!==e.env.NODE_ENV){Object.freeze(gn);var Rn=function(){};h((Rn.name||Rn.toString()).indexOf("testFn")!==-1,"It looks like you're using a minified copy of the development build of Inferno. When deploying Inferno apps to production, make sure to use the production build which skips development warnings and is faster. See http://infernojs.org for more details.")}var An={linkEvent:sn,createVNode:w,cloneVNode:E,NO_OP:pn,EMPTY_OBJ:gn,render:cn,findDOMNode:an,createRenderer:fn,options:yn};n.default=An,n.linkEvent=sn,n.createVNode=w,n.cloneVNode=E,n.NO_OP=pn,n.EMPTY_OBJ=gn,n.render=cn,n.findDOMNode=an,n.createRenderer=fn,n.options=yn,Object.defineProperty(n,"__esModule",{value:!0})})}).call(n,t(3))},function(e,n,t){e.exports=t(1),e.exports.default=e.exports},function(e,n){function t(){throw new Error("setTimeout has not been defined")}function o(){throw new Error("clearTimeout has not been defined")}function r(e){if(c===setTimeout)return setTimeout(e,0);if((c===t||!c)&&setTimeout)return c=setTimeout,setTimeout(e,0);try{return c(e,0)}catch(n){try{return c.call(null,e,0)}catch(n){return c.call(this,e,0)}}}function i(e){if(f===clearTimeout)return clearTimeout(e);if((f===o||!f)&&clearTimeout)return f=clearTimeout,clearTimeout(e);try{return f(e)}catch(n){try{return f.call(null,e)}catch(n){return f.call(this,e)}}}function a(){h&&p&&(h=!1,p.length?v=p.concat(v):m=-1,v.length&&l())}function l(){if(!h){var e=r(a);h=!0;for(var n=v.length;n;){for(p=v,v=[];++m<n;)p&&p[m].run();m=-1,n=v.length}p=null,h=!1,i(e)}}function u(e,n){this.fun=e,this.array=n}function d(){}var c,f,s=e.exports={};!function(){try{c="function"==typeof setTimeout?setTimeout:t}catch(e){c=t}try{f="function"==typeof clearTimeout?clearTimeout:o}catch(e){f=o}}();var p,v=[],h=!1,m=-1;s.nextTick=function(e){var n=new Array(arguments.length-1);if(arguments.length>1)for(var t=1;t<arguments.length;t++)n[t-1]=arguments[t];v.push(new u(e,n)),1!==v.length||h||r(l)},u.prototype.run=function(){this.fun.apply(null,this.array)},s.title="browser",s.browser=!0,s.env={},s.argv=[],s.version="",s.versions={},s.on=d,s.addListener=d,s.once=d,s.off=d,s.removeListener=d,s.removeAllListeners=d,s.emit=d,s.binding=function(e){throw new Error("process.binding is not supported")},s.cwd=function(){return"/"},s.chdir=function(e){throw new Error("process.chdir is not supported")},s.umask=function(){return 0}},function(e,n,t){"use strict";function o(e){return e&&e.__esModule?e:{default:e}}function r(e,n){if(!(e instanceof n))throw new TypeError("Cannot call a class as a function")}function i(e,n){if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!n||"object"!=typeof n&&"function"!=typeof n?e:n}function a(e,n){if("function"!=typeof n&&null!==n)throw new TypeError("Super expression must either be null or a function, not "+typeof n);e.prototype=Object.create(n&&n.prototype,{constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}),n&&(Object.setPrototypeOf?Object.setPrototypeOf(e,n):e.__proto__=n)}Object.defineProperty(n,"__esModule",{value:!0});var l=function(){function e(e,n){for(var t=0;t<n.length;t++){var o=n[t];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(e,o.key,o)}}return function(n,t,o){return t&&e(n.prototype,t),o&&e(n,o),n}}(),u=t(2),d=o(u),c=t(5),f=o(c),s=d.default.createVNode,p=function(e){function n(){return r(this,n),i(this,(n.__proto__||Object.getPrototypeOf(n)).apply(this,arguments))}return a(n,e),l(n,[{key:"render",value:function(){return s(2,"script")}}]),n}(f.default);n.default=p},function(e,n,t){e.exports=t(6),e.exports.default=e.exports},function(e,n,t){(function(n){/*!
	 * inferno-component v1.0.5
	 * (c) 2017 Dominic Gannaway
	 * Released under the MIT License.
	 */
!function(n,o){e.exports=o(t(1))}(this,function(e){"use strict";function t(e){return a(e)||l(e)}function o(e){return c(e)||u(e)}function r(e){return u(e)||e===!1||d(e)||c(e)}function i(e){return"function"==typeof e}function a(e){return"string"==typeof e}function l(e){return"number"==typeof e}function u(e){return null===e}function d(e){return e===!0}function c(e){return void 0===e}function f(e){throw e||(e=y),new Error("Inferno Error: "+e)}function s(e,n){if(28&e.flags){var t=e.parentVNode;t&&(t.dom=n,s(t,n))}}function p(){return e.createVNode(4096)}function v(n){return e.createVNode(1,null,null,n)}function h(e,n,t){var o=O.get(e);o||(o=[],O.set(e,o),Promise.resolve().then(function(){O.delete(e),g(e,n,function(){for(var e=0;e<o.length;e++)o[e]()})})),t&&o.push(t)}function m(e,n,t,o){i(n)&&(n=n(e.state));for(var r in n)e._pendingState[r]=n[r];!e._pendingSetState&&_?o||e._blockRender?(e._pendingSetState=!0,g(e,!1,t)):h(e,!1,t):(e.state=Object.assign({},e.state,e._pendingState),e._pendingState={})}function g(i,a,l){if((!i._deferSetState||a)&&!i._blockRender&&!i._unmounted){i._pendingSetState=!1;var u=i._pendingState,d=i.state,c=Object.assign({},d,u),h=i.props,m=i.context;i._pendingState={};var g=i._updateComponent(d,c,h,h,m,a,!0),y=!0;r(g)?g=p():g===e.NO_OP?(g=i._lastInput,y=!1):t(g)?g=v(g):b(g)&&("production"!==n.env.NODE_ENV&&f("a valid Inferno VNode (or null) must be returned from a component render. You may have returned an array or an invalid object."),f());var _=i._lastInput,k=i._vNode,O=_.dom&&_.dom.parentNode||(_.dom=k.dom);if(i._lastInput=g,y){var w=i._lifecycle;w?w.listeners=[]:w=new N,i._lifecycle=w;var E=i.getChildContext();E=o(E)?Object.assign({},m,i._childContext):Object.assign({},m,i._childContext,E),i._patch(_,g,O,w,E,i._isSVG,!1),w.trigger(),i.componentDidUpdate(h,d),e.options.afterUpdate&&e.options.afterUpdate(k)}var C=k.dom=g.dom,S=i._componentToDOMNodeMap;S&&S.set(i,g.dom),s(k,C),o(l)||l()}}var y="a runtime error occured! Use Inferno in development environment to find the error.",_="undefined"!=typeof window&&window.document,b=Array.isArray,N=function(){this.listeners=[],this.fastUnmount=!0};N.prototype.addListener=function(e){this.listeners.push(e)},N.prototype.trigger=function(){for(var e=this,n=0;n<this.listeners.length;n++)e.listeners[n]()};var k=y;"production"!==n.env.NODE_ENV&&(k="Inferno Error: Can only update a mounted or mounting component. This usually means you called setState() or forceUpdate() on an unmounted component. This is a no-op.");var O=new Map,w=function(n,t){this.state={},this.refs={},this._blockRender=!1,this._ignoreSetState=!1,this._blockSetState=!1,this._deferSetState=!1,this._pendingSetState=!1,this._pendingState={},this._lastInput=null,this._vNode=null,this._unmounted=!0,this._lifecycle=null,this._childContext=null,this._patch=null,this._isSVG=!1,this._componentToDOMNodeMap=null,this.props=n||e.EMPTY_OBJ,this.context=t||{}};return w.prototype.render=function(e,n,t){},w.prototype.forceUpdate=function(e){this._unmounted||_&&g(this,!0,e)},w.prototype.setState=function(e,t){this._unmounted||(this._blockSetState?("production"!==n.env.NODE_ENV&&f("cannot update state via setState() in componentWillUpdate()."),f()):this._ignoreSetState||m(this,e,t,!1))},w.prototype.setStateSync=function(e){this._unmounted||(this._blockSetState?("production"!==n.env.NODE_ENV&&f("cannot update state via setState() in componentWillUpdate()."),f()):this._ignoreSetState||m(this,e,null,!0))},w.prototype.componentWillMount=function(){},w.prototype.componentDidUpdate=function(e,n,t){},w.prototype.shouldComponentUpdate=function(e,n,t){return!0},w.prototype.componentWillReceiveProps=function(e,n){},w.prototype.componentWillUpdate=function(e,n,t){},w.prototype.getChildContext=function(){},w.prototype._updateComponent=function(t,o,r,i,a,l,u){if(this._unmounted===!0&&("production"!==n.env.NODE_ENV&&f(k),f()),r!==i||i===e.EMPTY_OBJ||t!==o||l){r===i&&i!==e.EMPTY_OBJ||(u||(this._blockRender=!0,this.componentWillReceiveProps(i,a),this._blockRender=!1),this._pendingSetState&&(o=Object.assign({},o,this._pendingState),this._pendingSetState=!1,this._pendingState={}));var d=this.shouldComponentUpdate(i,o,a);if(d!==!1||l){this._blockSetState=!0,this.componentWillUpdate(i,o,a),this._blockSetState=!1,this.props=i;var c=this.state=o;this.context=a,e.options.beforeRender&&e.options.beforeRender(this);var s=this.render(i,c,a);return e.options.afterRender&&e.options.afterRender(this),s}}return e.NO_OP},w})}).call(n,t(3))},function(e,n){e.exports={hello:"こんにちは"}}]);