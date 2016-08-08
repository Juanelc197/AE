<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="no-sidebar.aspx.cs" Inherits="AlegriaEmbotelladaWebApp.no_sidebar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE HTML>

<html>
<head>
    <title>Alegria Enbotellada</title>
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <link rel="stylesheet" href="ir-arriba/estiloss.css">
    <link rel="stylesheet" href="ir-arriba/fontss.css">
    <script src="ir-arriba/jquery-latest.js"></script>
    <script src="ir-arriba/arribaa.js"></script>
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <!--subur jijii-->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.dropotron.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
    <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
    </noscript>
    <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body class="no-sidebar">

    <!DOCTYPE HTML>
 
    <html>
    <head>
        <title>Alegria Enbotellada</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
            <link rel="stylesheet" href="css/skel.css" />
            <link rel="stylesheet" href="css/style.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>
    <body class="no-sidebar">
        <!--subur jijii-->
        <!--subur jijii-->
        <!--subur jijii-->
        <!--subur jijii-->
        <!--subur jijii-->
        <span class="ir-arriba icon-arrow-up"></span>
        <!--subur jijii-->
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <script type="text/javascript">





//<![CDATA[
var bits=100; // cuantos bits
var intensity=7; // que tan "poderosa" es la explosi�n. (recomendado entre 3 y 10)
var speed=20; // rapidez (a menor numero, mas rapido)
var colours=new Array("#03f", "#f03", "#0e0", "#93f", "#0cc", "#f93");
//azul rojo verde purpura cyan, naranjo

var dx, xpos, ypos, bangheight;
var Xpos=new Array();
var Ypos=new Array();
var dX=new Array();
var dY=new Array();
var decay=new Array();
var colour=0;
var swide=800;
var shigh=600;
function write_fire() {
var b, s;
b=document.createElement("div");
s=b.style;
s.position="absolute";
b.setAttribute("id", "bod");
document.body.appendChild(b);
set_scroll();
set_width();
b.appendChild(div("lg", 3, 4));
b.appendChild(div("tg", 2, 3));
for (var i=0; i<bits; i++) b.appendChild(div("bg"+i, 1, 1));
}
function div(id, w, h) {
var d=document.createElement("div");
d.style.position="absolute";
d.style.overflow="hidden";
d.style.width=w+"px";
d.style.height=h+"px";
d.setAttribute("id", id);
return (d);
}
function bang() {
var i, X, Y, Z, A=0;
for (i=0; i<bits; i++) {
X=Math.round(Xpos[i]);
Y=Math.round(Ypos[i]);
Z=document.getElementById("bg"+i).style;
if((X>=0)&&(X<swide)&&(Y>=0)&&(Y<shigh)) {
Z.left=X+"px";
Z.top=Y+"px";
}
if ((decay[i]-=1)>14) {
Z.width="3px";
Z.height="3px";
}
else if (decay[i]>7) {
Z.width="2px";
Z.height="2px";
}
else if (decay[i]>3) {
Z.width="1px";
Z.height="1px";
}
else if (++A) Z.visibility="hidden";
Xpos[i]+=dX[i];
Ypos[i]+=(dY[i]+=1.25/intensity);
}
if (A!=bits) setTimeout("bang()", speed);
}

function stepthrough() {
var i, Z;
var oldx=xpos;
var oldy=ypos;
xpos+=dx;
ypos-=4;
if (ypos<bangheight||xpos<0||xpos>=swide||ypos>=shigh) {
for (i=0; i<bits; i++) {
Xpos[i]=xpos;
Ypos[i]=ypos;
dY[i]=(Math.random()-0.5)*intensity;
dX[i]=(Math.random()-0.5)*(intensity-Math.abs(dY[i]))*1.25;
decay[i]=Math.floor((Math.random()*16)+16);
Z=document.getElementById("bg"+i).style;
Z.backgroundColor=colours[colour];
Z.visibility="visible";
}
bang();
launch();
}
document.getElementById("lg").style.left=xpos+"px";
document.getElementById("lg").style.top=ypos+"px";
document.getElementById("tg").style.left=oldx+"px";
document.getElementById("tg").style.top=oldy+"px";
}
function launch() {
colour=Math.floor(Math.random()*colours.length);
xpos=Math.round((0.5+Math.random())*swide*0.5);
ypos=shigh-5;
dx=(Math.random()-0.5)*4;
bangheight=Math.round((0.5+Math.random())*shigh*0.4);
document.getElementById("lg").style.backgroundColor=colours[colour];
document.getElementById("tg").style.backgroundColor=colours[colour];
}
window.onscroll=set_scroll;
function set_scroll() {
var sleft, sdown;
if (typeof(self.pageYOffset)=="number") {
sdown=self.pageYOffset;
sleft=self.pageXOffset;
}
else if (document.body.scrollTop || document.body.scrollLeft) {
sdown=document.body.scrollTop;
sleft=document.body.scrollLeft;
}
else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
sleft=document.documentElement.scrollLeft;
sdown=document.documentElement.scrollTop;
}
else {
sdown=0;
sleft=0;
}
var s=document.getElementById("bod").style;
s.top=sdown+"px";
s.left=sleft+"px";
}
window.onresize=set_width;
function set_width() {
if (typeof(self.innerWidth)=="number") {
swide=self.innerWidth;
shigh=self.innerHeight;
}
else if (document.documentElement && document.documentElement.clientWidth) {
swide=document.documentElement.clientWidth;
shigh=document.documentElement.clientHeight;
}
else if (document.body.clientWidth) {
swide=document.body.clientWidth;
shigh=document.body.clientHeight;
}
}
window.onload=function() { if (document.getElementById) {
set_width();
write_fire();
launch();
setInterval('stepthrough()', speed);
}}
//]]>
        </script>
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <!-- fuegos artificiales -->
        <!-- Header -->
        <div id="header">
            <div class="container">

                <!-- Logo -->
                <h1><a href="#" id="logo"><img src="images/pic02.png" /></a></h1>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                        <!--<li>
                            <a href="">Dropdown</a>
                            <ul>
                                <li><a href="#">Lorem ipsum dolor</a></li>
                                <li><a href="#">Magna phasellus</a></li>
                                <li><a href="#">Etiam dolore nisl</a></li>
                                <li>
                                    <a href="">Phasellus consequat</a>
                                    <ul>
                                        <li><a href="#">Lorem ipsum dolor</a></li>
                                        <li><a href="#">Phasellus consequat</a></li>
                                        <li><a href="#">Magna phasellus</a></li>
                                        <li><a href="#">Etiam dolore nisl</a></li>
                                        <li><a href="#">Veroeros feugiat</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Veroeros feugiat</a></li>
                            </ul>
                        </li>-->
                     
                        <li><a href="right-sidebar.html">Descargar</a></li>
                       
                    </ul>
                </nav>

            </div>
        </div>

        <!-- Main -->
        <div id="main" class="wrapper style1">
            <div class="container">
                <section>
                    <header class="major">
                        <h2 style="margin-left: 120px">Registro</h2>
                        <!-- TemplateBeginEditable name="doctitle" -->
                        <!-- TemplateEndEditable -->
                        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
                        <!-- TemplateBeginEditable name="head" -->
                        <!-- TemplateEndEditable -->
                        <!-- TemplateParam name="FormName" type="text" value="form1" -->
                        <!-- TemplateParam name="FormMethod" type="text" value="post" -->
                        <!-- TemplateParam name="FormAction" type="text" value="" -->
                        <!-- TemplateParam name="SubmitName" type="text" value="Submit" -->
                        <!-- TemplateParam name="SubmitLabel" type="text" value="Submit" -->

                        <body class="sub">
                            <form id="form1" runat="server">
                                <table width="90%" border="0" cellpadding="8">
                                    <tr>
                                        <td colspan="3" class="HeaderColor">
                                            <!-- TemplateBeginEditable name="Title" -->
                                            <h4>&nbsp;</h4>
                                            <!-- TemplateEndEditable -->
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor" nowrap>
                                            <!-- TemplateBeginEditable name="Label1" --> <!--User Name*--><!-- TemplateEndEditable -->
                                        </td>
                                        <td colspan="2" class="TitleColor">
                                            <!-- TemplateBeginEditable name="Value1" -->
                                            <label for="username">Nombre de usuario: </label>
                                            <asp:TextBox ID="txtusuario" runat="server" Width="261px"></asp:TextBox>
&nbsp;<br>
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label2" --> <!--Contrase�a--><!-- TemplateEndEditable -->
                                        </td>
                                        <td colspan="2" class="TitleColor">
                                            <!-- TemplateBeginEditable name="Value2" -->
                                            <label for="password">
                                                <br>
                                                Contrasea:
                                            </label>
                                            <asp:TextBox ID="txtpassword" Type ="password" runat="server"></asp:TextBox>
&nbsp;<!-- TemplateEndEditable --></td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor">
                                                <!-- TemplateBeginEditable name="Label3" -->
                                                <!--Confirmar<br>
                                                contrase�a*-->
                                                <!-- TemplateEndEditable -->                                 
                                        </td>
                                        <td width="43%" class="TitleColor">
                                            <!-- TemplateBeginEditable name="Value4" -->
                                               <br>
                                                Nombre(s):
                                            <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
&nbsp;<!-- TemplateEndEditable --></td>
                                        <td width="46%" class="TitleColor">
                                            <!-- TemplateBeginEditable name="Value4_2" -->        
                                                <br>
                                                Apellido:(s):
                                            <asp:TextBox ID="txtapellido" runat="server"></asp:TextBox>
&nbsp;<!-- TemplateEndEditable --></td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label5" --><!-- Correo--><!-- TemplateEndEditable -->
                                        </td>
                                        <td colspan="2" class="TitleColor">
                                            <!-- TemplateBeginEditable name="Value5" -->
                                            <label for="last">
                                                <br>
                                                Correo:
                                            </label>&nbsp;<asp:TextBox ID="txtemail" runat="server" Width="304px"></asp:TextBox>
&nbsp;<!-- TemplateEndEditable --></td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label6" --> <!-- TemplateEndEditable -->
                                        </td>
                                        <td colspan="2">
                                           
                                            <!-- TemplateEndEditable -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label7" --><!-- TemplateEndEditable -->

                                        </td>
                                        <td colspan="2">
                                            <!-- TemplateBeginEditable name="Value7" -->
                                            <table border="0" cellspacing="2" cellpadding="0">
                                                <tr style="text-align: left">
                                                    <td class="TitleColor">
                                                        <br>
                                                        Edad
                                                        <asp:TextBox ID="txtEdad" runat="server" Width="91px"></asp:TextBox>
&nbsp;</td>                
                                                </tr>
                                            </table>
                                            <!-- TemplateEndEditable -->
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label8" --> <!-- TemplateEndEditable -->

                                        </td>
                                        <td colspan="2">
                                            <!-- TemplateBeginEditable name="Value8" -->
                                            <!-- TemplateEndEditable -->
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label9" --> <!-- TemplateEndEditable -->

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="LabelColor">
                                            <!-- TemplateBeginEditable name="Label0" --> <!-- TemplateEndEditable -->

                                        </td>
                                        <td colspan="2">
                                            <br />
                                            <div align="center" >&nbsp;<asp:Button  ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td colspan="3">
                                            <!-- TemplateBeginEditable name="Questions" -->
                                            <p class="StoryContentColor">&nbsp;</p>
                                            <!-- TemplateEndEditable -->
                                        </td>
                                    </tr>
                                </table>
                            </form>
                </section>
            </div>
        </div>

        <!-- Footer -->
        <div id="footer">
            <div class="container">

                <!-- Lists -->
                <div class="row">
                    <div class="8u">
                        
                    </div>
                    <div class="4u">
                        <section>
                            <header class="major">
                                <h2>Alegria Embotellada</h2>
                                <br />
                                Empresa Psycho Pro
                            </header>
                            <ul class="contact">
                                <li>
                                    Correo <span><a href="#">Pysco_AlegriaEmbotellada@PyschoPro.tld</a></span></li>
                                <li>
                                    Telefono
                                    <span>(51)5562586</span>
                                </li>
                            </ul>
                        </section>
                    </div>
                </div>

                <!-- Copyright -->
               

            </div>
        </div>

    </body>
</html>>

<div class="4u">
   
</div>


<!-- Copyright -->





</body>
</html>


	

