\begingroup\efdlspecials
\isdljstrue
\makeatletter
\obeyspaces\obeylines\let^^M=\jsR%
\catcode`\"=12%
\gdef\dljsexerquiziii{%
var _thereisdjs=true;
/*
  Document Level JavaScript
  AcroTeX eDucation Bundle
  D. P. Story copyright 2000-\the\year
  \dlPkgInfoPkg Dated \dlPkgInfoDate
*/
var exerquizLoaded = true;
this.disclosed = true;
app.runtimeHighlight=false;
}%
\gdef\dljsexerquiziv{%
var ok2Continue = true;
var ProcessIt = true;
var retn;
var Score=0;
var ptScore=0;
var pcScore=0;
var quizGrade="C";
var NQuestions=0;
var NPointTotal=0;
var e = Math.E;
var pi = Math.PI;
var replaceExclaim = \replaceexclaim;
var negPointsAllowed = \negpointsallowed;
var negPointsMarkupAllowed = \negpointsmarkupallowed;
var aQuizControl = new Object;
var RightWrong=new Array();
var ProbValue = new Array();
var ProbDist = new Array();
var ProbType = new Array();
var Responses=new Array();
var appAlerts = new Object;
var _mathVars="x";
var _ModalNotOn=true;
var GradeScaleDefault=new Array(\eqGradeScale);
var aDlLibSpecResp=new Array(\dlLibSpecRespJS);
var JSfBuiltIn = new Array
    ( "abs","acos","asin","atan","ceil", "floor","cos","exp",
      "log","max","min","pow","random","round","sin",
      "sqrt","tan");
var JSfCustomEarly = new Array ("arctan", "arcsin", "arccos")
var JSfCustomLate = new Array
    ( "logc", "ln","sec","csc","cot",
       "asinh", "acosh","atanh","acoth","asech","acsch",
       "sinh", "cosh","tanh","coth","sech","csch","sgn",
       "C","P","fact","pi");
var JSf = new Array().concat(JSfCustomEarly, JSfBuiltIn, JSfCustomLate);
var JSfCustom = new Array().concat(JSfCustomEarly, JSfCustomLate);
var JSc = new Array("PI","E")
function ln(x) { return Math.log(x); }
function sec(x) { return 1/Math.cos(x); }
function csc(x) { return 1/Math.sin(x);}
function cot(x) { return Math.cos(x)/Math.sin(x); }
function arctan(x) { return Math.atan(x); }
function arcsin(x) { return Math.asin(x); }
function arccos(x) { return Math.acos(x); }
function logc(x) { return Math.LOG10E * Math.log(x); }
function C(x,y) {return ch(x,y);}
function P(x,y) {return perm(x,y);}
function sinh(x) { return ( Math.exp(x) - Math.exp(-x) )/2; }
function cosh(x) { return ( Math.exp(x) + Math.exp(-x) )/2; }
function tanh(x) {
    return (Math.exp(x)-Math.exp(-x))/(Math.exp(x)+Math.exp(-x)); }
function coth(x) {
    return ( Math.exp(x)+Math.exp(-x))/(Math.exp(x)-Math.exp(-x)); }
function sech(x) { return 2/( Math.exp(x) + Math.exp(-x) )/2; }
function csch(x) { return 2/( Math.exp(x) - Math.exp(-x) )/2; }
function asinh(x) { return Math.log (x+Math.sqrt(Math.pow(x,2)+1)); }
function acosh(x) {
    return Math.log (x+Math.sqrt(Math.pow(x,2)-1)); } // x ge 1
function atanh(x) { return .5*Math.log ((1+x)/(1-x)); } // -1 < x < 1
function acoth(x) { return atanh(1/x); } // |x| > 1
function asech(x) { return acosh(1/x); } // 0 < x le 1
function asch(x) { return asinh(1/x); } // x ne 0
function acsch(x) { return asinh(1/x); } // x ne 0
function sgn(x) { return (x==0?0:(x<0?-1:1)) };
var aGroup = new Array
    ( ["\(","\)",\eqParens],
      ["[","]",\eqBrackets],
      ["{","}",\eqBraces]
    );
}%
\gdef\dljsexerquizv{%
var _mto;
function eqAppAlert(args) {
    _ModalNotOn = false;
    var retn=app.alert(args);
    _mto= app.setTimeOut("_ModalNotOn = true", 100);
    return retn;
}
function CkBalP(UserInput,lDelimiter,rDelimiter)
{
    var Lcount=0, Rcount=0;
    for (var k=0; k < UserInput.length; k++)
    {
        if (UserInput.charAt(k) == lDelimiter) Lcount++;
        else if (UserInput.charAt(k) == rDelimiter) Rcount++;
    }
    return (Lcount==Rcount);
}
function CkBalVert(UserInput)
{
    var Lcount=0;
    for (var k=0; k < UserInput.length; k++)
        if (UserInput.charAt(k)=="|") Lcount++;
    return (Lcount \% 2 == 0);
}
function Ckfuncs(UserInput)
{
    var re, rei, reii;
    re = /[a-zA-Z]{2,}/g;
    reii=/r:|i:|,/g
    var _v=_mathVars.replace(reii,"");
rei=new RegExp("[^"+_v+"]", "g");
    aF = UserInput.match(re);
    if ( aF == null ) return true;
    for (var i=0; i < aF.length; i++)
    {
if ( rei.exec(aF[i]) == null ) continue;
        for(var j=0; j < JSf.length; j++)
            if ( aF[i].indexOf(JSf[j]) != -1 ) break;
        if (j < JSf.length) continue;
        for(var j=0; j < JSc.length; j++)
            if ( aF[i].indexOf(JSc[j]) != -1 ) break;
        if(j==JSc.length)
        {
            eqAppAlert(\eqerrBadMathFunc,3);
            ok2Continue=false;
            return false;
        }
    }
    return true;
}
function DisplayAnswer(fieldname,theanswer)
{
    ProcessIt = false;
    var oDefault;
    if (arguments.length > 2 )
        var oQName = arguments[2];
    else var oQName = oDefault;
    if (typeof oQName=="undefined")
        var oQName = new Object;
    var defaultColor=(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
    try {
    this.getField(fieldname).value=(theanswer);
    } catch(e) {}
    ProcessIt = true;
}
function EvalCorrAnsButton(fieldname,theanswer)
{
    theanswer = eval(theanswer);
    DisplayAnswer(fieldname,theanswer);
}
function FindBalP(UserInput,Poff,Forward)
{
    var j,depth;
    if (Forward)
    {
        for (depth=-1, j=Poff+1; depth !=0; j++)
        {
            if ( j > UserInput.length) return null;
            if (UserInput.charAt(j)=="\(") depth--;
            else if (UserInput.charAt(j)=="\)") depth++;
        }
        j--
    }
    else
    {
        for (depth=-1, j=Poff-1; depth !=0; j--)
        {
            if ( j < 1 ) return null;
            if (UserInput.charAt(j)=="\)") depth--;
            else if (UserInput.charAt(j)=="\(") depth++;
        }
        j++
    }
    return j;
}
function stripWhiteSpace (UserInput)
{
    UserInput = UserInput.replace(/\s/g,"");
    if(UserInput==null || UserInput.length==0)
    {
        ok2Continue = false;
        return false;
    } else return UserInput;
}
function stripOutMuli (UserInput)
{
    UserInput = UserInput.replace(/\*/g,"");
    return UserInput;
}
function addMathObject(UserInput)
{
    for ( var i=0; i < JSfBuiltIn.length; i++) {
        var re = new RegExp("\\b("+JSfBuiltIn[i]+")\\b","g");
        UserInput = UserInput.replace(re,"Math.$1");
    }
    re = /\b(PI)\b/g;
    UserInput = UserInput.replace(re,"Math.$1");
    return UserInput;
}
function ParseInput(UserInput)
{
    var re, repi;
    re = /\b(a)\b/g;
    UserInput = UserInput.replace(re, "(a)");
    UserInput = stripWhiteSpace (UserInput);
    if (!ok2Continue) return null;
    for(var i=0; i< aGroup.length; i++)
    {
        if(!CkBalP(UserInput, aGroup[i][0], aGroup[i][1]))
        {
            eqAppAlert(\eqerrDelimNotBal,3);
            ok2Continue = false;
            return false;
        }
    }
    UserInput = ChngAllGrpsToParens(UserInput);
    if ( replaceExclaim &&(typeof fact == "function") )
        UserInput = UserInput.replace(%
/(?=\()?(\d+)(?=\))?!/g,"fact($1)");
    if (!CkBalVert(UserInput))
    {
        eqAppAlert(\eqerrABS,3);
        ok2Continue = false;
        return false;
    }
    UserInput=groupJSf(UserInput);
    re=/(\w)(e)(\^)/g;
    repi=/(\w)(pi)/g;
    UserInput=UserInput.replace(re, "$1*$2$3");
    UserInput=UserInput.replace(repi, "$1*$2");
    UserInput=UserInput.replace(/(sec)/g, "s@e@c");
    re=/(\w)(e)([^\^])?/g;
    UserInput=UserInput.replace(re,"$1($2\^1)$3");
    UserInput=UserInput.replace(/(s@e@c)/g, "sec");
    re=/E(\d)/g;
    UserInput=UserInput.replace(re,"E+$1");
    re=/(\d)\*E/g;
    UserInput=UserInput.replace(re,"$1E");
        if(!Ckfuncs(UserInput)) return false;
    if (typeof(Ck4Exponents) != "undefined")
        UserInput = Ck4Exponents(UserInput);
    if (typeof(Ck4Products) != "undefined" )
        UserInput = Ck4Products(UserInput);
    ok2Continue = true;
    re = /\b(log)\b/g;
    UserInput = UserInput.replace(re, "logc");
    while (/\|/.test(UserInput)&&(ok2Continue))
    {
        re = /(\|)([^\|]*)(\|)([-\+\/\*\^\)\|])/;
        if (re.test(UserInput))
            if (re.exec(UserInput)[4] == '^')
                UserInput = UserInput.replace(re, "(abs($2))$4");
            else
                UserInput = UserInput.replace(re, "abs($2)$4");
        else
        {
            re = /(\|)([^\|]*)(\|$)/;
            if (re.test(UserInput))
                UserInput = UserInput.replace(re, "abs($2)");
        }
    }
    re=/\b(pi)\b/g;
    UserInput=UserInput.replace(re,"($1)")
    var reTstExp = /(\))?\^(\()?/g;
    while ( ((aResults=reTstExp.exec(UserInput))!=null)&&(ok2Continue) )
    {
        var firstGroup = Number(Boolean(aResults[1]));      // 0 or 1
        var secondGroup = 2*Number(Boolean(aResults[2]));   // 0 or 2
        var caseStudy = firstGroup+secondGroup;             // 0,1,2,3
        switch(caseStudy) {
            case 0:
                re=/([a-zA-Z]|\d*\.?\d*)\^([a-zA-Z]|[\+-]?\d+\.?\d*|%
[\+-]?\d*\.?\d+)/;
                if (re.test(UserInput))
                    UserInput=Ck4OddRoots(UserInput,re);
                else ok2Continue=false;
                break;
            case 1:
                aP =/\)\^/.exec(UserInput);
                LeftP=FindBalP(UserInput,aP.index,0);
                re = new RegExp("\\((.{"+eval(aP.index-LeftP-1)
                    +"})\\)\\^([a-zA-Z]|[\+-]?\\d+\\.?\\d*|%
[\+-]?\\d*\\.?\\d+)");
                if (re.test(UserInput))
                    UserInput=Ck4OddRoots(UserInput,re);
                else ok2Continue=false;
                break;
            case 2:
                aP = /\^\(/.exec(UserInput);
                RightP=FindBalP(UserInput,aP.index+1,1);
                re = new RegExp("([a-zA-Z]|\\d*\\.?\\d*)\\^\\((.{"
                    +eval(RightP-aP.index-2)+"})\\)");
                if (re.test(UserInput))
                    UserInput=Ck4OddRoots(UserInput,re);
                else ok2Continue=false;
                break;
            case 3:
                aP = /\)\^\(/.exec(UserInput);
                LeftP=FindBalP(UserInput,aP.index,0);
                RightP=FindBalP(UserInput,aP.index+2,1);
                re = new RegExp("\\((.{"+eval(aP.index-LeftP-1)
                    +"})\\)\\^\\((.{"+eval(RightP-aP.index-3)+"})\\)");
                if (re.test(UserInput))
                    UserInput=Ck4OddRoots(UserInput,re);
                else ok2Continue=false;
                break;
            default:
                ok2Continue=false;
        }
    }
    if (!ok2Continue)
    {
        eqAppAlert(\eqerrBadExp,3);
        return false;
    }
    else {
        UserInput=addMathObject(UserInput);
        return UserInput;
    }
}
function ChngAllGrpsToParens(UserInput)
{
    UserInput = UserInput.replace(/\[|\{/g, "\(");
    UserInput = UserInput.replace(/\]|\}/g, "\)");
    return UserInput;
}
function Ck4OddRoots(UserInput,re) {
    var a=re.exec(UserInput);
    while ( a[2].charAt(0)=="\(") {
        var RightP=FindBalP(a[2],0,1); // forward search
        if (RightP == a[2].length-1)
            a[2]=a[2].substring(1,a[2].length-1);
        else break;
    }
    var b=a[2].split("/");
    if ( b.length==2 ) {
        try { _m=eval(b[1])
            if ( _m == undefined || isNaN(_m) ) throw new Error();
            var d = b[1];
    var isEnclosed=(d.charAt(0) == "\(" && d.charAt(d.length-1)=="\)");
    if (!isEnclosed)
        if (/.+[\+\-].+/.test(d)) throw new Error();
    if (isEnclosed) d = s.substring(1,d.length-1);
    var n = b[0];
    isEnclosed=(n.charAt(0) == "\(" && n.charAt(d.length-1)=="\)");
    if (!isEnclosed)
            if (/.+[\+\-].+/.test(n)) throw new Error();
            if ( d == parseInt(d) && ( Boolean(d \% 2) ) ) {
                UserInput=UserInput.replace(re,
                    "(pow(sgn($1),"+n+")*(pow(abs($1),$2)))");
                return UserInput;
            }
        } catch(e) {}
    }
    UserInput=UserInput.replace(re,"(pow($1,$2))");
    return UserInput;
}
function groupJSf(UserInput)
{
    var re, regexp, aP, RightP;
    for (var i=0; (i<JSf.length) && (ok2Continue); i++)
    {
        re = new RegExp(JSf[i]+"\\\(");
        while ( re.test(UserInput) && (ok2Continue) )
        {
            regexp = new RegExp(JSf[i]+"\\\(", "g");
            if ( (aP = regexp.exec(UserInput)) != null )
            {
                RightP=FindBalP(UserInput,regexp.lastIndex-1,1);
                offsetArg = RightP - regexp.lastIndex;
                regexp = new RegExp(%
"("+JSf[i]+")\\((.{"+offsetArg+"})\\)");
                regexp.lastIndex=0;
                if (regexp.test(UserInput))
                    UserInput=UserInput.replace(regexp,"($1@($2))");
                else ok2Continue=false;
                continue;
            }
        }
    }
    UserInput=UserInput.replace(/@/g,"");
    return UserInput;
}
function TypeParameters(v)
{
    var aV;
    aV = ( (v.indexOf(":") == -1) && (v.indexOf(",") == -1) ) ?
        v.split("") : v.split(",");
    for ( var i=0; i < aV.length; i++)
        if ( aV[i].indexOf(":") == -1 ) aV[i] = "r:"+aV[i];
    return aV.join(",")
}
function ProcResp(flag,CorrAns,n,epsilon,domain,indepVars,oComp)
{
    if (!ProcessIt) return null;
    var fieldname = event.target.name;
    var bSubstVars=(arguments.length>7); // dps17
    var UserAns=(arguments.length>7)?arguments[7]:event.value;
    var success = _ProcResp(flag,CorrAns,UserAns,%
n,epsilon,domain,indepVars,oComp);
    if ( success == -1 || !ok2Continue )
      { resetHeadsUp(flag,fieldname); return null; } // dps17
    if ( success == null )
      { resetHeadsUp(flag,fieldname);
        return syntaxError(), null; } // dps17
    return notifyField(success, flag, fieldname);
}
// changed name of var comp -> oComp
function _ProcResp(flag,CorrAns,UserAns,n,epsilon,domain,%
indepVars,oComp){
    ok2Continue = true;
    CorrAns = ParseInput(CorrAns);
    if (!ok2Continue) {
        eqAppAlert("Syntax error in author's answer! Check console.",3);
        return null;
    }
    var comp = ( typeof oComp == "object" ) ?
        ((typeof oComp.comp == "undefined" ) ?
            diffCompare : oComp.comp ) : oComp;
    if ( (typeof(oComp)=="object") %
&& (typeof(oComp.priorParse)!="undefined") ) {
        var retn=processSpecialParse(oComp.priorParse,UserAns);
        if (retn==null) return -1;
    }
    var reCP=/((C|P)\(.+?)(,)(.+?\))/g
    UserAns=UserAns.replace(reCP,"$1@c@$4");
    var reComma=/,/;
    if ( reComma.test(UserAns) ) {
        eqAppAlert(\eqSyntaxErrorComma,3);
        return -1;
    }
     var reRlCommaSubst=/@c@/g;
     UserAns=UserAns.replace(reRlCommaSubst,",");
    UserAns = ParseInput(UserAns);
    indepVars = TypeParameters(indepVars);
    if (!ok2Continue) return null;
    var success=randomPointCompare(n,domain,indepVars,%
epsilon,CorrAns,UserAns,comp);
        if ( success && (typeof(oComp)=="object") %
&& (typeof(oComp.postParse)!="undefined") )
        success=processSpecialParse(oComp.postParse,UserAns);
    return success;
}
function processSpecialParse(oParse,UserAns) {
    var retn, f, _o
    if ( typeof(oParse) == "object" ) {
        for ( var i=0; i < oParse.length; i++) {
            _o=oParse[i];
            if (typeof(_o)=="function") {
               retn=_o(UserAns);
               if (retn==null) return retn;
            } else {
                retn=_o[0].apply(null, [ UserAns ].concat(_o.slice(1)));
                if (retn==null) return null;
            }
        }
    } else {
        retn = oParse(UserAns);
    }
    return retn;
}
function randomPointCompare (n,domain,indepVars,epsilon,%
CorrAns,userAns,comp)
{
    var error, i, j, k;
    var aXY = new Array();
    domain = domain.replace(/[\[\]\s]/g, "");
    var aIntervals = domain.split("&");
    for (k=0; k < aIntervals.length; k++)
    {
        var aInterval = aIntervals[k].split("x");
        nI = aInterval.length;
        with (Math) {
            for (j=0; j < n; j++)
            {
                for (i=0; i < nI; i++)
                {
                    var endpoints = aInterval[i].split(",");
                    aXY[i] = eval(endpoints[0])-0+(eval(endpoints[1])%
-eval(endpoints[0]))*Math.random();
                }
                var cXY = aXY.toString();
                error = comp(domain,cXY,indepVars,CorrAns,userAns);
                if (error == null) return null;
                if ( (error == -1) || (error > epsilon) ) {j=-1; break;}
            }
        }
        if (j!=n) return false;
    }
    return true;
}
function diffCompare(_a,_c,_v,_F,_G) {
    var aXY = _c.split(",");
    var _V = _v.split(",");  // e.g. _V[0] = "i:x"
    var _n = aXY.length;
    for (var _i=0; _i < _n; _i++)
    {
        if (_V[_i].charAt(0) == "r" )
          eval ("var "+_V[_i].charAt(2)+"="+aXY[_i]+";");
        else // assume type "i"
          eval ("var "+_V[_i].charAt(2)+"="+Math.ceil(aXY[_i])+";");
    }
    _F = eval(_F);
    if ( app.viewerVersion >= 5)
    {
        var rtnCode = 0;
        eval("try {if(isNaN(_G = eval(_G))) rtnCode=-1; }"
            +"catch (e) { rtnCode=1; }");
        switch(rtnCode)
        {
            case  0: break;
            case  1: return null;
            case -1: return -1;
        }
    }
    else
        if(isNaN(_G = eval(_G))) return -1;
    return Math.abs ( _F - _G );
}
function reldiffCompare(_a,_c,_v,_F,_G) {
    var aXY = _c.split(",");
    var _V = _v.split(",");  // e.g. _V[0] = "i:x"
    var _n = aXY.length
    for (var _i=0; _i < _n; _i++)
    {
            if (_V[_i].charAt(0) == "r" )
              eval ("var "+_V[_i].charAt(2)+"="+aXY[_i]+";");
            else // assume type "i"
              eval ("var "+_V[_i].charAt(2)+"="+Math.ceil(aXY[_i])+";");
    }
    _F = eval(_F);
    if ( app.viewerVersion >= 5)
    {
        var rtnCode = 0;
        eval("try { if(isNaN(_G = eval(_G))) rtnCode=-1; }"
            +"catch (e) { rtnCode=1; }");
        switch(rtnCode)
        {
            case  0: break;
            case  1: return null;
            case -1: return -1;
        }
    }
    else
        if(isNaN(_G = eval(_G))) return -1;
    return Math.abs ( (_F - _G)/_G );
}
function requireForm(UserAns, regexpr) {
    var msg=\defaultReqFormMsg;
    UserAns = stripWhiteSpace (UserAns);
    if (!ok2Continue) return null;
    UserAns = ChngAllGrpsToParens(UserAns);
    if (arguments.length>2) msg=arguments[2];
    if (typeof(regexpr.length)=="undefined") {
        if (regexpr.test(UserAns)) return true;
        else { eqAppAlert(msg,3); return null; }
    } else {
        for (var i=0; i<regexpr.length; i++)
            if (regexpr[i].test(UserAns)) break;
        if ( i < regexpr.length ) return true;
        else { eqAppAlert(msg,3); return null; }
    }
}
function denyForm(UserAns, regexpr) {
    var msg=\defaultReqFormMsg;
    UserAns = stripWhiteSpace (UserAns);
    if (!ok2Continue) return null;
    UserAns = ChngAllGrpsToParens(UserAns);
    if (arguments.length>2) msg=arguments[2];
    if (typeof(regexpr.length)=="undefined") {
        if (regexpr.test(UserAns)) { eqAppAlert(msg,3); return null; }
        else return true;
    } else {
        for (var i=0; i<regexpr.length; i++)
            if (regexpr[i].test(UserAns)) break;
        if ( i < regexpr.length ) { eqAppAlert(msg,3); return null; }
        else return true;
    }
}
function requireFormNot(UserAns, regexpr) {
    UserAns = stripWhiteSpace (UserAns);
    if (!ok2Continue) return null;
    UserAns = stripOutMuli(UserAns);
    UserAns = ChngAllGrpsToParens(UserAns);
    if (typeof(regexpr.length)=="undefined") {
        if (regexpr.test(UserAns)) return false;
        else return true;
    } else {
        for (var i=0; i<regexpr.length; i++)
            if (regexpr[i].test(UserAns)) break;
        if ( i < regexpr.length ) return false;
        else return true;
    }
}
}%
\gdef\dljsexerquizvi{%
if (!String.prototype.trim) {
  String.prototype.trim = function () {
    return this.replace(/^[\s\string\\uFEFF\string\\xA0]+|%
[\s\string\\uFEFF\string\\xA0]+$/g, '');
  };
}
function _rplVarsBy(str1,str2) {
    var re=new RegExp(str1,"g");
    var result=str1.replace(re,str2);
    return result;
}
function processMathVars(str) {
  var pos1,pos2,lead,tmp;
  while ((pos1=str.indexOf("_rplVarsBy"))!=-1) {
    pos2=str.indexOf("@");
    lead=str.substring(0,pos1);
    tmp=str.substring(pos1,pos2);
    str=str.substring(pos2+1);
    tmp=eval(tmp);
    str=lead+tmp+str;
  }
  str=str.replace(/\s/g,"");
  return str;
}
getSubstValue.aSubsts=new Array();
function getSubstValue(v,s){
  var pos1,pos2,tmp,args,re,arg1,arg2;
  re=/([^'])(,)/g;
  v=v.replace(re,'$1');
  re=/([ri]\string\:)+(\string\w)/g;
  v=v.replace(re,'$2');
  getSubstValue.aSubsts=[]; // dps17
  var start=0;
  while (true) {
    v=v.substring(start);
    pos1=v.indexOf("_rplVarsBy");
    if (pos1==-1) break;
    pos2=v.indexOf("@");
    args=v.substring(pos1+10+1,pos2-1);
    tmp=args.split(",");
    arg1=eval(tmp[0].toString());
    tmp1=arg1.split("->");
    for (var i=0; i<tmp1.length; i++)
      tmp1[i]=tmp1[i].trim();
    if (tmp1.length==1) getSubstValue.aSubsts.push(tmp1[0]);
    else getSubstValue.aSubsts.push(tmp1);
    arg2=eval(tmp[1].toString());
    re=new RegExp(tmp1[0],"g");
    s=s.replace(re,arg2);
    start=pos2+1;
  }
  return s;
}
function RespBoxAppr(e){
  var value=(typeof e=="object")?e.value:e;
  var re;
  for (var i=0; i<getSubstValue.aSubsts.length; i++) {
    if (typeof getSubstValue.aSubsts[i]=="object") {
      re=new RegExp(getSubstValue.aSubsts[i][0],"g");
      value=(value.replace(re,getSubstValue.aSubsts[i][1],"g"));
    }
  }
  return value;
}
}%
\gdef\dljsexerquizvii{%
function ProcRespTxt() {
    var i, success, authorAnswer, userAnswer = event.value;
    var fieldname=event.target.name;
    var flag = arguments[0];
    var filterMethod = arguments[1];
    var compareMethod = arguments[2];
    if ( !ProcessIt || userAnswer == "" ) return null;
    for (i = 3; i < arguments.length; i++)
        if ( success = compareTxt(userAnswer,arguments[i],%
filterMethod, compareMethod)) break;
    return notifyField(success, flag, fieldname);
}
function ProcRespTxtPC() {
    var i, success, authorAnswer, userAnswer = event.value;
    ProcRespTxtPC.txtPCpCr=0;
    var fieldname=event.target.name;
    var flag = arguments[0];
    var filterMethod = arguments[1];
    var compareMethod = arguments[2];
    if ( !ProcessIt || userAnswer == "" ) return null;
    for (i=3;i<arguments.length;i++)
        if(compareTxt(userAnswer,arguments[i][0],%
filterMethod,compareMethod))
            ProcRespTxtPC.txtPCpCr+=(arguments[i][1]);
    success=(ProcRespTxtPC.txtPCpCr>0);
    return notifyField(success,flag,fieldname);
}
function compareTxt(userAnswer,authorAnswer,filterMethod,compareMethod)
{
    var caseSensitive = ( compareMethod==3 ) ? "" : "i";
    var reSwitches = "g"+caseSensitive;
    userAnswer = new String(userAnswer).filter(filterMethod);
    switch(compareMethod) {
        case 1:
            var AuthorAnswer;
            var aAuthorAnswer = authorAnswer.split(/\s+/);
            for (var j=0; j < aAuthorAnswer.length; j++) {
                AuthorAnswer = new String(%
aAuthorAnswer[j]).filter(filterMethod);
                AuthorAnswer = AuthorAnswer.replace(/\./g,"\\.");
                AuthorAnswer = AuthorAnswer.replace(/@any@/g,".");
                var re = new RegExp(AuthorAnswer, reSwitches);
                if (!re.test(userAnswer)) return false;
            }
            return true;
        default:
            authorAnswer=new String(authorAnswer).filter(filterMethod);
            return (userAnswer == authorAnswer) ? true : false;
    }
}
String.prototype.filter = eqFilter;
function eqFilter(filterMethod) {
    switch (filterMethod) {
        case 0:
            var re = /\W/g;
            return this.replace(re,"").toLowerCase();
        case 1:
            var re = /\s/g;
            return this.replace(re,"").toLowerCase();
        case 2:
            var re = /\s/g;
            return this.replace(re,"");
        case 3:
        default:
            return this.toString();
    }
}
function checkTheSpelling(targetFieldName) {
  var spellChkCnt=0;
  var f=this.getField(targetFieldName);
  var value=f.value;
  var valueStrip = value.replace(/\s+/g,"");
  if ( valueStrip != "" ) {
    aBrk=value.split(/\s+/);
    for (var i=0; i<aBrk.length; i++){
      var word=aBrk[i];
      var aRetnSC=spell.checkWord(word);
      if (aRetnSC!=null) spellChkCnt++;
    }
    var corrdStr=spell.checkText(value);
    f.value=corrdStr;
  }
  return spellChkCnt;
}
}%
\gdef\dljsexerquizviii{%
function InitMsg(msg) { return (\eqInitQuizMsg) }
function syntaxError() { eqAppAlert(\eqSyntaxErrorUndefVar,3); }
var lstOfQuizzes=new Object();
var reExtractBaseName=/^.+?\.(.+?)\..+$/;
function ProcUserResp(key,userresp,probno,notify)
{
    if (key==null) {
        ProcUserNoResp.apply(null,arguments);
        return;
    }
    if ( arguments.length > 4 ) {
        if ( typeof RightWrong[probno] == "undefined" ) {
            RightWrong[probno] = new Array();
            RightWrong[probno][0] = "grp";
            Responses[probno] = new Array();
        }
        RightWrong[probno][arguments[4]] = (!!key) ? 1 : 0;
        Responses[probno][arguments[4]] = userresp;
    } else {
      if ( typeof key == "object" ) {
          RightWrong[probno][0] = key[0];
          RightWrong[probno][1] = key[1];
          Responses[probno] = userresp;
          if (Responses[probno].length==0)
            Responses[probno]=undefined;
      } else {
        RightWrong[probno] = (!!key)?1:0;
        Responses[probno] = userresp;
      }
    }
    if ( (typeof fieldPopTbl == "function")&&(event.type != "Link") ) {
        var a=reExtractBaseName.exec(event.target.name);
        fieldPopTbl(a[1]);
    }
}
function ProcUserNoResp(key,userresp,probno,notify)
{
  if ( arguments.length > 4 ) {
    RightWrong[probno][arguments[4]] = undefined;
    Responses[probno][arguments[4]] = undefined;
    var bVoidArray=true;
    for (var i=0; i<Responses[probno].length; i++) {
      if ( typeof Responses[probno][i] != "undefined") {
        bVoidArray=false;
        break;
  }
    }
if (bVoidArray) {
Responses[probno]=undefined;
RightWrong[probno]=undefined;
      ProbValue[probno]=undefined;
}
  } else {
      RightWrong[probno] = undefined;
      Responses[probno] = undefined;
  }
  if ( typeof fieldPopTbl == "function" ) {
    var a=reExtractBaseName.exec(event.target.name);
    fieldPopTbl(a[1]);
  }
}
function InitializeQuiz(qtfield,mark) {
    var oQName=eval(qtfield);
    Score=0;
    retn = null;
    if (!isQuizInitialized(qtfield)&&!isAQuizUnfinished()) return null;
    neutralizeQuizzes();
    ProcessIt = false;
    aQuizControl[qtfield] = 1;
    this.resetForm(["ScoreField." + qtfield,"mc."+qtfield,
      "obj."+qtfield,"mck."+qtfield,"Ans."+qtfield,
      "PointsField."+qtfield,"PercentField."+qtfield,
      "essay."+qtfield,"GradeField."+qtfield,
      "grpobj."+qtfield,"qMark."+qtfield, qtfield+"SanityCheck",
      qtfield+"SanityCheckPts",qtfield+"SanityCheckOOPts",
      "rbmarkup."+qtfield]);
    ProcessIt = true;
    var f = this.getField("qMark."+qtfield);
    if ( f != null ) f.display = display.hidden;
    f = this.getField("promptButton."+qtfield);
    if (f != null) f.display=display.visible;
    if (arguments.length<3)  {
        f = this.getField("obj." + qtfield);
        if ( f != null ) f.readonly = false;
    }
    RightWrong=new Array();
    Responses=new Array();
    ProbValue=new Array();
    ProbDist=new Array();
    ProbType=new Array();
    if (mark==1)
    {
        var defaultColor=(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
        var rightColor=(typeof oQName.RightColorJSLoc=="undefined")%
?\rghtColorJS:oQName.RightColorJSLoc;
        var corrAnsSymb=(typeof oQName.CorrAnsSymbJSLoc=="undefined")%
?\corrAnsSymbJS:oQName.CorrAnsSymbJSLoc;
        var f = this.getField("mcq." + qtfield);
        if (f != null) {
            f.delay=true;
            f.display=display.hidden;
            this.resetForm([f.name]);
            f.textColor = rightColor;
            var a = f.getArray();
            for (var i=0; i<a.length; i++) a[i].style=corrAnsSymb;
            f.delay=false;
        }
        f = this.getField("obj." + qtfield);
        if ( f != null ) f.strokeColor = defaultColor;
        f = this.getField("grpobj." + qtfield);
        if ( f != null ) f.strokeColor = defaultColor;
        f = this.getField("corr." + qtfield);
        if ( f != null ) f.display = display.hidden;
        f = this.getField(qtfield+"SanityCheck");
        if ( f != null ) f.strokeColor=defaultColor;
        f = this.getField("rbmarkup."+qtfield);
        if ( f != null ) f.display = display.hidden;
    }
    return null;
}
function resetHeadsUp(flag,fieldname) {
  if (flag==1) return;
  var pos1=fieldname.indexOf(".");
  var pos2=fieldname.indexOf(".",pos1+1);
  var baseName=fieldname.substring(pos1+1,pos2);
  var oQName=eval(baseName);
  var defaultColor=(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
  var f=this.getField(fieldname);
  if (f!=null) f.strokeColor=defaultColor;

}
function neutralizeQuizzes()
{
    for ( var qtfield in aQuizControl ) aQuizControl[qtfield] = 0;
}
isAQuizUnfinished.check=true;
function isAQuizUnfinished()
{
    if (!isAQuizUnfinished.check) return true;
    for ( var qtfield in aQuizControl )
        if ( aQuizControl[qtfield] == 1 )
        {
            eqAppAlert(\eqerrUnfinishQuiz, 3);
            return false;
        }
    return true;
}
function isQuizInitialized(qtfield)
{
    if (typeof (aQuizControl[qtfield]) == "undefined")
        return false;
    else
        return (aQuizControl[qtfield] == 1);
}
function isEndQuizPushed(qtfield)
{
    if (typeof (aQuizControl[qtfield]) == "undefined")
        return false;
    else
        return (aQuizControl[qtfield] == -1);
}
function resetQuiz(qtfield)
{
    aQuizControl[qtfield] = -1;
}
function RecordPointValue(ptvalue,probno)
{
  if (arguments.length > 2) {
    if ( typeof ProbValue[probno] == "undefined" ) {
      ProbValue[probno]=[1,arguments[5],arguments[3],arguments[4]];
      ProbValue[probno][3+arguments[2]] = ptvalue;
    } else ProbValue[probno][3+arguments[2]] = ptvalue;
  }
  else {
    ProbValue[probno]=ptvalue;
  }
}
function RecordProblemType(qType,probno)
{
    ProbType[probno]=qType;
}
function GrpRight( a, nProb, qtfield )
{
    var f = this.getField("grpobj."+qtfield+"."+nProb);
    var l = f.getArray().length
    var prod = 1;
    for ( var i=1; i <= l; i++) prod *= !!a[i];
    return prod;
}
function DisplayQuizResults(qtfield,nPointTotal,nQuestions)
{
    Score = 0; ptScore = 0;
    NPointTotal=nPointTotal; NQuestions=nQuestions;
    for (var i=1; i < RightWrong.length; i++)
    {
        if ( (typeof RightWrong[i] == "object" ) && %
( RightWrong[i][0] == "grp" ) ) {
            // grouped question
            Score += GrpRight(RightWrong[i], i, qtfield);
            var aWeights = ProbValue[i].slice(2);
            var evalGrpJS = eval(ProbValue[i][1]);
            var evalGrpJSValue = evalGrpJS(this,qtfield,i,
                RightWrong[i],aWeights);
            ProbDist[i] = evalGrpJSValue;
            ptScore = ptScore + evalGrpJSValue;
        } else {
            if (typeof RightWrong[i] == "object") {
                if ( RightWrong[i][0] == 1 ) {
                    Score++;
                    ProbDist[i]=(typeof ProbValue[i] == "object") ?
                        1*ProbValue[i][1] : 1*ProbValue[i];
                    ptScore += (1*ProbDist[i]);
                } else {
                    if (RightWrong[i][1] == 1)
                        ProbDist[i]=(typeof ProbValue[i]=="object") ?
                            1*ProbValue[i][1] : 1*ProbValue[i];
                    else {
                        ProbDist[i]=(typeof ProbValue[i] == "object") ?
                            1*ProbValue[i][1] : 0;
                        if (!negPointsAllowed && %
!negPointsMarkupAllowed && (ProbDist[i]<0) ) ProbDist[i]=0;
                    }
                    ptScore += (1*ProbDist[i]);
                }
            } else {
                if (RightWrong[i]==1) {
                    Score++;
                    ProbDist[i] = ( typeof ProbValue[i] == "object") ? %
1*ProbValue[i][1] : 1*ProbValue[i];
                    ptScore += (1*ProbDist[i]);
                }
                else {
                    ProbDist[i] = ( typeof ProbValue[i] == "object") ? %
1*ProbValue[i][2] : 0;
                    ptScore += (1*ProbDist[i]);
                }
            }
        }
    }
    if ( !negPointsAllowed && (ptScore < 0) ) ptScore = 0;
    if (ptScore == nPointTotal) pcScore = 100;
    else pcScore = util.printf("\%.1f", (100 * ptScore) / nPointTotal);
    var oQName=eval(qtfield);
    var gradeScale=%
(typeof oQName.GradeScaleLoc=="undefined")%
?GradeScaleDefault:oQName.GradeScaleLoc;
    quizGrade = GetGrade.apply(null,gradeScale);
    var f = this.getField("ScoreField."+qtfield);
    if ( f != null ) f.value=(\eqQuizTotalMsg);
    f = this.getField("PointsField."+qtfield);
    if ( f != null) f.value=(\eqQuizPointsMsg);
    f = this.getField("PercentField."+qtfield);
    if ( f != null) f.value=(\eqQuizPercentMsg);
    f = this.getField("GradeField."+qtfield);
    if ( f != null) f.value=(\eqQuizGradeMsg);
}
function GetGrade()
{
    var cGrade, aRange;
    var l = arguments.length/2;
    if (pcScore >=100) return arguments[0];
    if (pcScore < 0 ) return arguments[arguments.length-2];
    for (var i=0; i < l; i++)
    {
        cGrade = arguments[2*i];
        aRange = arguments[2*i+1];
        if ( (pcScore >= arguments[2*i+1][0])
            && (pcScore < arguments[2*i+1][1])) return cGrade;
    }
    return null;
}
function ProcessQuestion (key,letterresp,probno,
    quizno,qtfield,notify,mark,msg) {
    var silent = ( arguments.length > 8 ) ? true : false;
    if (!isQuizInitialized(qtfield))
    {
        if (!silent) eqAppAlert(InitMsg(msg),3);
        this.resetForm(["mc."+qtfield+"."+probno,
            "mck."+qtfield+"."+probno]);
    }
    else
    {
        ProcUserResp(key,letterresp,probno,notify);
        if (mark==1)
        {
            var oQName=eval(qtfield);
            var defaultColor=%
(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
            var rightColor=%
(typeof oQName.RightColorJSLoc== "undefined")%
?\rghtColorJS:oQName.RightColorJSLoc;
            var wrongColor=%
(typeof oQName.WrongColorJSLoc=="undefined")%
?\wrngColorJS:oQName.WrongColorJSLoc;
            var rightAnsSymb=%
(typeof oQName.RightAnsSymbJSLoc=="undefined")%
?\rghtAnsSymbJS:oQName.RightAnsSymbJSLoc;
            var wrongAnsSymb=%
(typeof oQName.WrongAnsSymbJSLoc=="undefined")%
?\wrngAnsSymbJS:oQName.WrongAnsSymbJSLoc;
            var corrAnsSymb=%
(typeof oQName.CorrAnsSymbJSLoc=="undefined")%
?\corrAnsSymbJS:oQName.CorrAnsSymbJSLoc;
            var f = this.getField("mcq."+qtfield+"."+probno);
            var fck = this.getField("mck."+qtfield+"."+probno);
            var bMultiSelect = ( fck != null ) ? true : false;
            f.delay=true;
            this.resetForm([f.name]);
            var a = f.getArray();
            var l = a.length;
            if ( bMultiSelect ) {
                var ack = fck.getArray();
                for ( var i=0; i<l; i++) {
                    if ( ack[i].isBoxChecked(0)  ) {
                        a[i].style = ( a[i].isDefaultChecked(0) ) ?
                            rightAnsSymb : wrongAnsSymb;
                        a[i].textColor = ( a[i].isDefaultChecked(0) ) ?
                            rightColor : wrongColor;
                        a[i].value = "Yes";
                    } else {
                        a[i].style = ( a[i].isDefaultChecked(0) ) ?
                            corrAnsSymb : wrongAnsSymb;
                        a[i].textColor = ( a[i].isDefaultChecked(0) ) ?
                            rightColor : wrongColor;
                        a[i].value = ( a[i].isDefaultChecked(0) ) ?
                            "Yes" : "Off";
                    }
                }
            } else {
                for (var i=0; i < a.length; i++)
                    if (a[i].style == rightAnsSymb)
                    {
                        a[i].style = corrAnsSymb;
                        a[i].textColor = rightColor;
                    }
                var qr=this.getField(%
"mcq."+qtfield+"."+probno+"."+quizno);
                qr.textColor = key ? rightColor :wrongColor;
                qr.style = key ? rightAnsSymb : wrongAnsSymb;
                qr.value="Yes"; // gr.checkThisBox(0);  // ver 5.0
            }
            this.getField("mcq."+qtfield+"."+probno).delay=false;
        }
    }
    if ( typeof fieldPopTbl == "function" ) fieldPopTbl(qtfield);
}
function correctQuiz(qtfield,nQuestions)
{
  var bROQD=(typeof oRecordOfQuizData=="object");
  if(bROQD && %
(typeof oRecordOfQuizData["RightWrong."+qtfield]!="undefined")) {
    RightWrong=oRecordOfQuizData["RightWrong."+qtfield];
    ProbDist=oRecordOfQuizData["ProbDist."+qtfield];
  }
  var oQName=eval(qtfield);
  var defaultColor=(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
  var rightColor=(typeof oQName.RightColorJSLoc=="undefined")%
?\rghtColorJS:oQName.RightColorJSLoc;
  var wrongColor=(typeof oQName.WrongColorJSLoc=="undefined")%
?\wrngColorJS:oQName.WrongColorJSLoc;
  var rightAnsSymb=(typeof oQName.RightAnsSymbJSLoc=="undefined")%
?\rghtAnsSymbJS:oQName.RightAnsSymbJSLoc;
  var wrongAnsSymb=(typeof oQName.WrongAnsSymbJSLoc=="undefined")%
?\wrngAnsSymbJS:oQName.WrongAnsSymbJSLoc;
  var bFullyCorrect=(typeof oQName.fullyCorrectLoc=="undefined")%
?\eqCorrChoiceFully:oQName.fullyCorrectLoc;
  var f = this.getField("mcq." + qtfield);
  if ( f != null) {
    if (bFullyCorrect) { // dpsf07
      f.display = display.visible;
    } else {
      for (var n=1; n<=nQuestions; n++) {
        var h=this.getField("mc."+qtfield+"."+n);
        var bOk=(h!=null);
        if(bOk) var choiceType="mc";
        else {
          h=this.getField("mck."+qtfield+"."+n);
          bOk=(h!=null);
          var choiceType="mck";
        }
        if (bOk) {
          var mcq=this.getField("mcq."+qtfield+"."+n);
          var g=mcq.getArray();
          if (choiceType=="mc") {
            for (var j=0; j< g.length; j++) {
              g[j].display=(h.isBoxChecked(j))?%
display.visible:display.hidden;
              }
            } else {
              var ck=h.getArray();
              for (var j=0; j< g.length; j++) {
                g[j].display=(ck[j].isBoxChecked(0))?%
display.visible:display.hidden;
              }
            }
          }
        }
      }
    }
    f = this.getField("obj." + qtfield);
    if ( f != null ) {
    var a = f.getArray();
    var re=/^obj\./;
    for (var i = 0; i < a.length; i++) {
      var probno = a[i].name.replace(/.*\./g,"");
      var rbmuname = a[i].name.replace(re,"rbmarkup\.");
      var oRBMarkup = this.getField(rbmuname);
      var bRBMU = ( oRBMarkup != null );
      if ( RightWrong[probno] == 1 ) {
        a[i].strokeColor = rightColor;
        if (bRBMU) {
            oRBMarkup.textColor=rightColor;
            oRBMarkup.style=rightAnsSymb;
        }
      } else {
        a[i].strokeColor = wrongColor;
        if (bRBMU) {
            oRBMarkup.textColor=wrongColor;
            oRBMarkup.style=wrongAnsSymb;
        }
      }
    }
  }
  f = this.getField("grpobj." + qtfield);
  var re=/^grpobj\./;
  if ( f != null ) {
    var a = f.getArray();
    for ( var i = 0; i < a.length; i++) {
      var rbmuname = a[i].name.replace(re,"rbmarkup\.");
      var oRBMarkup = this.getField(rbmuname);
      var bRBMU = ( oRBMarkup != null );
      var aX = a[i].name.split(".");
      var probno = 1*aX[aX.length-2];
      var grpProbno = 1*aX[aX.length-1];
      if ( ( RightWrong[probno] != undefined ) %
&& ( RightWrong[probno][grpProbno] == 1 ) ) {
        a[i].strokeColor = rightColor;
        if (bRBMU) {
            oRBMarkup.textColor=rightColor;
            oRBMarkup.style=rightAnsSymb;
        }
      } else {
        a[i].strokeColor = wrongColor;
        if (bRBMU) {
          oRBMarkup.textColor=wrongColor;
          oRBMarkup.style=wrongAnsSymb;
        }
      }
    }
  }
  f=this.getField("rbmarkup."+qtfield);
  if ( f != null ) f.display = display.visible;
  f = this.getField("promptButton." + qtfield)
  if ( f != null ) f.display = display.hidden;
  f = this.getField("corr." + qtfield);
  if ( f != null ) f.display = display.noPrint;
  f = this.getField("qMark."+qtfield);
  if ( f != null ) {
    for ( var i = 1; i <= nQuestions; i++) {
      if ( ProbValue[i] == undefined ) ProbValue[i]=0;
      f = this.getField("qMark."+qtfield+"."+(i-1));
      if ( f != null ) {
        // find the next non-null field
        for ( var j=i; j <= nQuestions; j++)
        {
            var h = this.getField("qMark."+qtfield+"."+j);
            if ( h != null ) break;
        }
        var g = f.getArray();
        var qpts=(ProbDist[i]==undefined) ? 0 : ProbDist[i];
        if ( !negPointsMarkupAllowed && (qpts < 0) ) qpts=0;
        g[0].value = qpts + (( qpts == 1 ) ? " \eqptLabel\space"
            : " \eqptsLabel");
      }
    }
    this.getField("qMark."+qtfield).display = display.visible;
  }
}
function getTotalTally(basename) {
    var sqtotal=0;
    var f=this.getField("tally."+basename);
    var g = f.getArray();
    for (var i=0; i<g.length; i++) {
        if ( g[i] == event.target ) sqtotal += (1*event.value);
        else sqtotal += (1*g[i].value);
    }
    if ( ( f=this.getField("tallytotal."+basename) ) != null )
        f.value = sqtotal;
}
function clearAllSubQuizzes() {
    isAQuizUnfinished.check=false;
    for ( var o in lstOfQuizzes) {
        if (lstOfQuizzes[o].isSubmitted)
            eval ( lstOfQuizzes[o].initializeWith );
    }
    isAQuizUnfinished.check=true;
}
}%
\gdef\dljsexerquizix{%
function ProcessMultiSelection(key,letterresp,probno,%
quizno,qtfield,pts,ppts) {
    var f = this.getField("mck."+qtfield+"."+probno);
    if ( typeof ProbValue[probno] == "undefined" )  {
        var g = f.getArray();
        var nTotalCorrect = 0;
        for ( var i=0; i<g.length; i++ )
            nTotalCorrect += (1*g[i].exportValues[0].charAt(0));
        ProbValue[probno] = new Array();
        RightWrong[probno] = new Array();
        ProbValue[probno] = [nTotalCorrect,pts,[]];
        RightWrong[probno][2] = new Array();
    } else var nTotalCorrect = ProbValue[probno][0];
    var fck = this.getField("mck."+qtfield+"."+probno+"."+quizno);
    if ( fck.isBoxChecked(0) ) {
        ProbValue[probno][2][quizno] = ppts;
        RightWrong[probno][2][quizno] = key;
    } else {
        ProbValue[probno][2][quizno] = undefined;
    }
    var pointsThisProblem=0;
    var scoreThisProblem = 0;
    var letterResponses = new Array();
    var areAllCorrect=1;
    var numCorrect=0;
    for ( var i=1; i< ProbValue[probno][2].length; i++ ) {
        if ( typeof ProbValue[probno][2][i] != "undefined" )
            letterResponses[i] = (String.fromCharCode(96+i));
        pointsThisProblem += ( ( typeof ProbValue[probno][2][i]==%
"undefined" )?0:ProbValue[probno][2][i]);
        if ( typeof ProbValue[probno][2][i]!="undefined" ) {
            areAllCorrect *= (1*RightWrong[probno][2][i]);
            numCorrect +=(1*RightWrong[probno][2][i]);
        }
    }
    scoreThisProblem = areAllCorrect*numCorrect;
    var scoreThisProblem = Number( scoreThisProblem == nTotalCorrect );
    if (scoreThisProblem==1 && pointsThisProblem==0 )
        pointsThisProblem=pts;
    ProbValue[probno][1] =
        ( (ProbValue[probno][1] == 0) && (scoreThisProblem == 1) )
            ? pts : pointsThisProblem;
    var passKey = ( pointsThisProblem > 0 ) ? 1 : 0;
    var retn = [ [ scoreThisProblem, passKey ], letterResponses ] ;
    return retn;
}
function LimitSelection(n,fname,k) {
    var f = this.getField(fname);
    var g = f.getArray();
    var total=0;
    for (var i=0; i<g.length; i++) {
        total+=( g[i].isBoxChecked(0) );
    }
    if (total > n) {
        eqAppAlert(\limSelWarningMsg,3);
        f=this.getField(fname+"."+k);
        f.checkThisBox(0,false);
        return false
    } else return true;
}
}%
\gdef\dljsexerquizx{%
function chooseJSColor( b, c1, c2 ) {
    return ( b ) ? c1 : c2;
}
function notifyField(success, flag, fieldname) {
  if ( flag != 0 )
    return (success)?true:false;
  var f = this.getField(fieldname);
  var re=/^(obj|grpobj)\./;
  var gname=fieldname.replace(re,"rbmarkup\.");
  var g =this.getField(gname);
  var isthereRBUP = ( g !=null );
  var h = fieldname.replace(re,"");
  var index=h.indexOf(".");
  var oQName = eval(h.substring(0,index));
  var rightColor=(typeof oQName.RightColorJSLoc=="undefined")%
?\rghtColorJS:oQName.RightColorJSLoc;
  var rightSymb=(typeof oQName.RightColorJSLoc=="undefined")%
?\rghtAnsSymbJS:oQName.RightAnsSymbJSLoc;
  var wrongColor=(typeof oQName.WrongColorJSLoc=="undefined")%
?\wrngColorJS:oQName.WrongColorJSLoc;
  var wrongSymb=(typeof oQName.WrongAnsSymbJSLoc=="undefined")%
?\wrngAnsSymbJS:oQName.WrongAnsSymbJSLoc;
  if (success) {
    f.strokeColor = rightColor;
    if (isthereRBUP) {
      g.style = rightSymb;
      g.textColor=rightColor;
      g.display=display.visible;
    }
      return true;
  } else {
    updateTally.downState=false;
    updateTally(fieldname);
    f.strokeColor = wrongColor;
    if (isthereRBUP) {
      b2 = ( typeof oQName.WrongAnsSymbJSLoc == "undefined" );
      g.style = wrongSymb;
      g.textColor=wrongColor;
      g.display=display.visible;
    }
    return false;
  }
}
function updateTally(fieldname)
{
    var objre = /^obj\./;
    var grpre = /^grpobj\./;
    if ( grpre.test(fieldname) ) {
        fieldname = fieldname.replace(grpre,"");
        var pos = fieldname.lastIndexOf(".");
        fieldname = fieldname.substring(0,pos);
    } else if ( objre.test(fieldname) )
        fieldname = fieldname.replace(objre,"");
    var f = this.getField("tally."+fieldname);
    if ( f != null ) {
        if (!updateTally.downState) f.value += 1;
        return true;
    } else return false;
}
var bNoPeekWait=false;
var oNoPeekTimer;
function noPeek(qtfield,rtnPage)
{
  if (!bNoPeekWait) {
    if ( (typeof (aQuizControl[qtfield]) == "undefined") %
|| (aQuizControl[qtfield] != -1) ) {
      bNoPeekWait=true;
      oNoPeekTimer=app.setTimeOut("bNoPeekWait=false;%
app.clearTimeOut(oNoPeekTimer);",5);
      this.pageNum = rtnPage-1;
      \NoPeekAlert;
    }
  } else this.pageNum = rtnPage-1;
}
var oCB=\bcheckboxused
function OnBlurRespBox (retn)
{
  var qname = arguments[1];
  var oQName = eval(qname);
  var respMsg;
  var cTitle = "AcroTeX eDucation Bundle";
  if (retn != null) {
    if ( typeof appAlerts[qname] == "undefined")
      appAlerts[qname] = {bAfterValue: false, %
cMsg: "\doNotShowAgainMsg"};
    var respMsg = (retn) ? \eqsqrtmsg\space : \eqsqwgmsg;
    if ( (event.target == this) || !oCB)
      eqAppAlert({ cMsg: respMsg, nIcon: 3, cTitle: cTitle });
    else {
      if ( ! appAlerts[arguments[1]].bAfterValue )
        eqAppAlert({ cMsg: respMsg, nIcon: 3, cTitle: cTitle, %
oCheckbox: appAlerts[qname]});
    }
  }
  else {
   var re=/^(obj|grpobj)\./;
   var gname=event.target.name.replace(re,"rbmarkup\.");
   var g =this.getField(gname);
   var isthereRBUP = ( g !=null );
    var str = event.target.value.toString();
    if (str.replace(/\s/g,"") == "") {
      var defaultColor=%
(typeof oQName.DefaultColorJSLoc=="undefined")%
?\defaultColorJS:oQName.DefaultColorJSLoc;
   if (isthereRBUP) g.display=display.hidden;
        event.target.strokeColor = defaultColor;
    }
  }
}
function jmpToNamedDest(fName,cDest,bAlert) {
    if ( (typeof appAlerts[fName]!="undefined" %
&& appAlerts[fName].bAfterValue) || bAlert==0)
        app.setTimeOut("this.gotoNamedDest(\""+cDest+"\")",500);
    else
        this.gotoNamedDest(cDest);
}
function lowThreshold(nQuestions)
{
    return true;
}
function highThreshold(nQuestions)
{
    var cnt=0;
    for ( var i=0; i< Responses.length; i++ ) {
        if ( typeof Responses[i]!="undefined") cnt++
    }
    if ( cnt<nQuestions )
        eqAppAlert(\highThresholdMsg,3);
    return (cnt >= nQuestions);
}
}%
\gdef\dljsexerquizxi{%
function groupEval(doc,qtfield,probno,aKey,aWeights)
{
    var totalGrpPts = aWeights[0];
    var totalWeight = aWeights[1];
    for ( var i=1,total=0; i< aKey.length; i++ )
        if (aKey[i] != undefined) total += aKey[i]*aWeights[i+1];
    return total;
}
function WeightedEval(doc,qtfield,probno,aKey,aWeights)
{
    var f = doc.getField("grpobj." + qtfield + "." + probno);
    var nGrpQno = f.getArray().length;
    var totalGrpPts = aWeights[0];
    var totalWeight = aWeights[1];
    for ( var i=1,total=0; i < aKey.length; i++ )
        if (aKey[i] != undefined) total += aKey[i]*aWeights[i+1];
    total /= totalWeight;
    total = Math.floor( total * totalGrpPts );
    return total;
}
function groupBernoulliEval(doc,qtfield,probno,aKey,aWeights)
{
    var f = doc.getField("grpobj." + qtfield + "." + probno);
    var nGrpQno = f.getArray().length;
    var totalGrpPts = aWeights[0];
    for ( var i=1,isCorrect=1; i<= nGrpQno; i++ )
        isCorrect *= (aKey[i] != undefined) ? (Number(aKey[i])) : 0;
    return (isCorrect*totalGrpPts);
}
}%
\endgroup
\begingroup 
\catcode`\<=12 
\catcode`\>=12 
\ccpdftex%
\input{dljscc.def}%
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquiziii) >> }
\xdef\objexerquiziii{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquiziv) >> }
\xdef\objexerquiziv{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizv) >> }
\xdef\objexerquizv{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizvi) >> }
\xdef\objexerquizvi{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizvii) >> }
\xdef\objexerquizvii{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizviii) >> }
\xdef\objexerquizviii{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizix) >> }
\xdef\objexerquizix{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizx) >> }
\xdef\objexerquizx{\the\pdflastobj\space0 R}
\immediate\pdfobj{ << /S/JavaScript/JS(\dljsexerquizxi) >> }
\xdef\objexerquizxi{\the\pdflastobj\space0 R}
\endgroup 
