import{a as v,t as n}from"./disclose-version.DUeUvj-E.js";import{i as E,p as R}from"./stores.cXl4S_JY.js";import{h as V,i as S,a7 as N,a8 as B,p as F,f as m,a as H,s as p,t as A,c as l,r as u,o as P}from"./runtime.C4ks8q1m.js";import{i as w}from"./if.Bm-Kbp_P.js";import{s as I,a as K}from"./store.CDJrpWXb.js";function L(r,e,a,t,i){var h;V&&S();var s=(h=e.$$slots)==null?void 0:h[a],c=!1;s===!0&&(s=e.children,c=!0),s===void 0||s(r,c?()=>t:t)}function x(r,e,a,t){var i=r.__attributes??(r.__attributes={});V&&(i[e]=r.getAttribute(e),r.nodeName==="LINK")||i[e]!==(i[e]=a)&&(a==null?r.removeAttribute(e):typeof a!="string"&&T(r).includes(e)?r[e]=a:r.setAttribute(e,a))}var M=new Map;function T(r){var e=M.get(r.nodeName);if(e)return e;M.set(r.nodeName,e=[]);for(var a,t=N(r),i=Element.prototype;i!==t;){a=B(t);for(var s in a)a[s].set&&e.push(s);t=N(t)}return e}var W=n('<a href="/">Home</a> <a href="/research">Research</a> <a href="/cv">CV</a> <a href="/music">Music</a> <a>Français 🇫🇷</a>',1),j=n('<a href="/fr">Accueil</a> <a href="/fr/recherche">Recherche</a> <a href="/fr/cv">CV</a> <a href="/fr/musique">Musique</a> <a>English 🇬🇧</a>',1),D=n('<div>Built by yours truly using <a href="https://svelte.dev/">Svelte</a>.</div> <div>Want to discuss opportunities to collaborate or chat over a coffee? Please <a href="mailto:francois@charih.ca">reach out</a>!</div>',1),G=n(`<div>Page bâtie avec amour et <a href="https://svelte.dev/">Svelte</a>.</div> <div>Vous voulez discuter d'une opportunité de collaborer ou parler en sirotant
      un bon café? N'hésitez-pas à <a href="mailto:francois@charih.ca">me contacter</a>!</div>`,1),J=n('<header class="svelte-1viqegy"><!></header> <section class="svelte-1viqegy"><div class="padder svelte-1viqegy"><!></div></section> <footer class="svelte-1viqegy"><!></footer>',1);function Z(r,e){F(e,!1);const a=I();let i=K(R,"$page",a).url.pathname,s=i.split("/").slice(-1)[0],c=i.includes("fr"),h={"":"/fr",research:"fr/recherche",cv:"fr/cv",music:"fr/musique"},$={fr:"/",recherche:"/research",musique:"/music",cv:"/cv"};E();var y=J(),d=m(y),k=l(d);w(k,()=>!c,f=>{var o=W(),g=p(m(o),8);A(()=>x(g,"href",h[s])),v(f,o)},f=>{var o=j(),g=p(m(o),8);A(()=>x(g,"href",$[s])),v(f,o)}),u(d);var _=p(d,2),q=l(_),z=l(q);L(z,e,"default",{}),u(q),u(_);var b=p(_,2),C=l(b);w(C,()=>!c,f=>{var o=D();P(2),v(f,o)},f=>{var o=G();P(2),v(f,o)}),u(b),v(r,y),H()}export{Z as P,x as s};