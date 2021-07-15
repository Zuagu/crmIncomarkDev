<!DOCTYPE html>
<html>
<head>  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script> 
    <script type="text/javascript" src="org.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
 background:#fff !important;
}

.text{
	color: rgba(31,181,172,.9);
	text-align: center;
}


.folded-corner:hover .text{
	visibility: visible;
	color: #000000;;
}
.Services-tab{
	margin-top:20px;
	

}

/*
  nav link items
*/
.folded-corner{
  padding: 25px 25px;
  position: relative;
  font-size: 90%;
  text-decoration: none;
  color: #999; 
  background: transparent;
  transition: all ease .5s;
  border: 1px solid rgba(31,181,172,.9);
  border-radius: 20%;
}
.folded-corner:hover{
	background-color: rgba(31,181,172,.9);
}

/*
  paper fold corner
*/

.folded-corner:before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  border-style: solid;
  border-width: 0 0px 0px 0;
  border-color: #ddd #000;
  transition: all ease .3s;
}

/*
  on li hover make paper fold larger
*/
.folded-corner:hover:before {
/*	background-color: #D00003;
  border-width: 0 50px 50px 0;
  border-color: #eee #000;*/
  
}

.service_tab_1{
	background-color: #fff;
}
.service_tab_1:hover .fa-icon-image{
    color: #000;
/*    transform: rotate(360deg) scale(1.5);*/
}


.fa-icon-image{
	color: rgba(31,181,172,.9);
	display: inline-block;
    font-style: normal;
    font-variant: normal;
    font-weight: normal;
    line-height: 1;
    font-size-adjust: none;
    font-stretch: normal;
    -moz-font-feature-settings: normal;
    -moz-font-language-override: normal;
    text-rendering: auto;
    transition: all .65s linear 0s;
    text-align: center;
    transition: all 1s cubic-bezier(.99,.82,.11,1.41);
}
.hide{
  display:none;
}
/*%grid-column {
    position: relative;
    width: 50% !important;
    min-height: 1px; // Prevent columns from collapsing when empty
    padding-right: ($gutter / 2);
    padding-left: ($gutter / 2);
  }*/
    </style>    
</head>
<body id="active_check">
    <div class="container-fluid">
        <div class="row">
			<div class="col-lg-2 offset-lg-2 col-md-2 offset-md-2 col-sm-4 col-xs-4 Services-tab  item">
				<div id="div1" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-print fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Impresiones</p>
						</p><!-- /.item-title -->
					</div>
				</div>
		    </div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div2" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-cube fa-3x fa-icon-image" ></i>
						<p class="item-title">
							<p>Paquetes</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div3" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-truck fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Integración Tiendas</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div4" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-diamond fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Integración Paqueterías</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 offset-lg-2 col-md-2 offset-md-2 col-sm-4 col-xs-4 Services-tab  item">
				<div id="div5" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-line-chart fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Deshabilitar Paqueterías</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div6" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-mobile fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Usuarios</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div7" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-money fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Datos de Factura</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 Services-tab item">
				<div id="div8" class="folded-corner service_tab_1">
					<div class="text">
						<i class="fa fa-bullhorn fa-3x fa-icon-image"></i>
						<p class="item-title">
							<p>Notificaciones</p>
						</p><!-- /.item-title -->
					</div>
				</div>
			</div>
		</div>		
		<div id="impresiones" class="row hide">
			<h1>HOlaaaaa1</h1>
		</div>
		<div id="paquetes" class="row hide">
			<h1>HOlaaaaa2</h1>
		</div>
		<div id="integracion_tiendas" class="row hide">
			<h1>HOlaaaaa8</h1>
		</div>
		<div id="integracion_paqueterias" class="row hide">
			<h1>HOlaaaaa3</h1>
		</div>
		<div id="deshabilitar_paqueterias" class="row hide">
			<h1>HOlaaaaa4</h1>
		</div>
		<div id="usuarios" class="row hide">
			<h1>HOlaaaaa5</h1>
		</div>
		<div id="datos_factura" class="row hide">
			<h1>HOlaaaaa6</h1>
		</div>
		<div id="notificaciones" class="row hide">
			<h1>HOlaaaaa7</h1>
		</div>
<!--        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="display:none;">
            <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Contact</a>
            </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">.1.</div>
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">.2.</div>
            <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">.3.</div>
        </div>-->
        <div class="row">
<!--            <table class="table mx-auto">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a id="test1">impresiones</a></td>
                        <td><a id="test2">paquetes</a></td>
                    </tr>
                    <tr>
                        <td><a id="test3">integracion tiendas</a></td>
                        <td><a id="test4">integracion paqueterias</a></td>
                    </tr>
                    <tr>
                        <td><a id="test5">deshabilitar paqueterias</a></td>
                        <td><a id="test6">usuarios</a></td>
                    </tr>
                    <tr>
                        <td><a id="test7">datos de factura</a></td>
                        <td><a id="test8">notificaciones</a></td>
                    </tr>
                </tbody>
            </table>-->
        </div>
    </div>
    <script>
        $(document).ready(function () {
});
function displays(){
	if($("#active_check").attr("class") == "active"){
		$("#active_check").removeClass("active");	
		$("#div1").show();
		$("#div2").show();
		$("#div3").show();
		$("#div4").show();
		$("#div5").show();
		$("#div6").show();
		$("#div7").show();
		$("#div8").show();
	} else{
		$("#active_check").addClass("active");
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").hide();
		$("#div4").hide();
		$("#div5").hide();
		$("#div6").hide();
		$("#div7").hide();
		$("#div8").hide();
	}
}

$("#div1").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div2").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#paquetes").addClass("hide");
	} else {
		$("#paquetes").removeClass("hide");
	}
	displays();
	$(this).show();;
});
$("#div3").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#integracion_tiendas").addClass("hide");
	} else {
		$("#integracion_tiendas").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div4").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div5").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div6").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div7").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
$("#div8").on("click", function() {
	if($("#active_check").attr("class") == "active"){
		$("#impresiones").addClass("hide");
	} else {
		$("#impresiones").removeClass("hide");
	}
	displays();
	$(this).show();
});
//        $(document).ready(function () {
// numero 1 representa si tiene mas puestos debajo esa area
    // function generarUl (parametro, para2) {
    //     console.log(parametro);
    //     for (var i = 0; i < parametro.length; i++) {
    //         var ul = document.getElementById(para2);
    //         var li = document.createElement("li");        // Create a <button> element
    //         var t = document.createTextNode(parametro[i]);       // Create a text node
    //         li.appendChild(t);                                // Append the text to <button>
    //         ul.appendChild(li);
    //         if(parametro[i] == 1){
    //             var subpuestos = parametro[i];
    //             for (var i = 0; i < subpuestos.length; i++) {
                        
    //             }
    //         }
    //     }
    // }
    // $("#botin").on("click", function () {
    //     var arrai = ["jefi", "jefei", "jefoi", "jefui", "jefeeer"]; // proviene del back
    //     var para2 = "sisi";
    //     generarUl(arrai, para2);
    //     console.log(arrai);
    // });
//});
//
//$('#test1').on('click', function (e) {
//    e.preventDefault()
//  $('#pills-tab a[href="#pills-profile"]').tab('show');
//});
//$('#test2').on('click', function (e) {
//    e.preventDefault()
//  $('#pills-tab a[href="#pills-home"]').tab('show');
//});
//$('#test3').on('click', function (e) {
//    e.preventDefault()
//  $('#pills-tab a[href="#pills-contact"]').tab('show');
//});
    </script>
</body>
</html>
