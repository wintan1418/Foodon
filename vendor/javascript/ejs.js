import e from"./utils.js";import r from"fs";import n from"./filters.js";var s;var t="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var i={};var a=e,l=r;i.version="0.7.2";var f=i.filters=n;var o={};i.clearCache=function(){o={}};function filtered(e){return e.substr(1).split("|").reduce((function(e,r){var n=r.split(":"),s=n.shift(),t=n.shift()||"";t&&(t=", "+t);return"filters."+s+"("+e+t+")"}))}function rethrow(e,r,n,s){var t=r.split("\n"),i=Math.max(s-3,0),a=Math.min(t.length,s+3);var l=t.slice(i,a).map((function(e,r){var n=r+i+1;return(n==s?" >> ":"    ")+n+"| "+e})).join("\n");e.path=n;e.message=(n||"ejs")+":"+s+"\n"+l+"\n\n"+e.message;throw e}var u=i.parse=function(e,r){var r=r||{},n=r.open||i.open||"<%",s=r.close||i.close||"%>";var t=["var buf = [];","\nwith (locals) {","\n  buf.push('"];var a=1;var l=false;for(var f=0,o=e.length;f<o;++f)if(e.slice(f,n.length+f)==n){f+=n.length;var u,c,p="__stack.lineno="+a;switch(e.substr(f,1)){case"=":u="', escape(("+p+", ";c=")), '";++f;break;case"-":u="', ("+p+", ";c="), '";++f;break;default:u="');"+p+";";c="; buf.push('"}var h=e.indexOf(s,f),v=e.substring(f,h),d=f,m=0;if("-"==v[v.length-1]){v=v.substring(0,v.length-2);l=true}while(~(m=v.indexOf("\n",m)))m++,a++;":"==v.substr(0,1)&&(v=filtered(v));t.push(u,v,c);f+=h-d+s.length-1}else if("\\"==e.substr(f,1))t.push("\\\\");else if("'"==e.substr(f,1))t.push("\\'");else if("\r"==e.substr(f,1))t.push(" ");else if("\n"==e.substr(f,1))if(l)l=false;else{t.push("\\n");a++}else t.push(e.substr(f,1));t.push("');\n}\nreturn buf.join('');");return t.join("")};var c=i.compile=function(e,r){r=r||{};var n=JSON.stringify(e),s=r.filename?JSON.stringify(r.filename):"undefined";e=["var __stack = { lineno: 1, input: "+n+", filename: "+s+" };",rethrow.toString(),"try {",i.parse(e,r),"} catch (err) {","  rethrow(err, __stack.input, __stack.filename, __stack.lineno);","}"].join("\n");r.debug&&console.log(e);var l=new Function("locals, filters, escape",e);return function(e){return l.call(this||t,e,f,a.escape)}};i.render=function(e,r){var n,r=r||{};if(r.cache){if(!r.filename)throw new Error('"cache" option requires "filename".');n=o[r.filename]||(o[r.filename]=c(e,r))}else n=c(e,r);r.__proto__=r.locals;return n.call(r.scope,r)};i.renderFile=function(e,r,n){var s=e+":string";"function"==typeof r&&(n=r,r={});r.filename=e;try{var t=r.cache?o[s]||(o[s]=l.readFileSync(e,"utf8")):l.readFileSync(e,"utf8");n(null,i.render(t,r))}catch(e){n(e)}};i.__express=i.renderFile;!{}?void 0&&(void 0)(".ejs",(function(e){return c(e,{})})):{}[".ejs"]=function(e,n){t.source=s=r.readFileSync(n,"utf-8");e._compile(c(s,{}),n)};const p=i.version,h=i.clearCache,v=i.render,d=i.renderFile,m=i.__express;const b=i.filters,g=i.parse,_=i.compile;export default i;export{m as __express,h as clearCache,_ as compile,b as filters,g as parse,v as render,d as renderFile,p as version};
