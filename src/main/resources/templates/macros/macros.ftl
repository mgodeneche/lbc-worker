<#macro alertMsg id style key visible=false suffix='' closeBtn=false class='' rowClass='row-fluid'>
<div class="${rowClass}">
	<div id="${id}" class="alert alert-${style} alert-dismissible ${class}" <#if !visible>style="display:none"</#if> role="alert">
		<#if closeBtn><button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only"></span></button></#if>
		<#if key?has_content><@spring.message "${key}"/></#if>${suffix}
	</div> 
</div>
</#macro>

<#macro confMsg>
<section class="popin_content padding40" id="confirm_msg" style="display: none;">
  <div class="row-fluid">
    <div class="span6 offset3">
    	<div class="span12">
			  <@alertMsg '','success', 'common.save.ok', true />	      	
      	</div>
      </div>
    </div>
</section>
</#macro>

<#macro title i18nKey>
<div class="popin_header_content center">
    <h2><@spring.message "${i18nKey}.h2" /></h2>
    <h3><@spring.message "${i18nKey}.h3" /></h3>
</div>
</#macro>

<#macro sub_title num i18nKey>
<h3><span class="numero">${num}</span> <@spring.message i18nKey /></h3>
</#macro>

<#macro save>
<div class="row-fluid">
    <div class="span12 padding25"><button type="submit" class="btn btn-blue btn-grand" id="f1"><@spring.message "common.save" /></button></div>
</div>
</#macro>

<#macro input_checkbox_univer value color mycat>
	<input type="hidden" name="cat_color_${value}" id="cat_color_${value}" value="${color}" />
	<input name="effinity_univer[]" type="checkbox" value="${value}" class="hide">
	<#assign wording><@spring.message "form.categorie.${value}"/></#assign>
	<div id="cat_id_${value}" class="checkbox_univer check_enfinity ${color} clickable<#if categories?exists && categories[value]?exists> over</#if>"><img src="${baseHref}/img/valide.png" class="pull-left padding10" >
		<span class="elt${color} uppercase<#if wording?length gte 18> padding-right20</#if>" id="cat_name_${value}">${wording}</span>
	</div>
</#macro>

<#macro inputCb i18nKey id="" style="">
<label for="disableGroup_change" class="checkbox text-grey open-sans-regular">
  <div class="checker">
    <span>
      <input id="${id}" name="${id}" type="checkbox" value="1" style="display:none">
      <div class="check_add ${style}" onclick="javascript:decor_chk('chk_${id}');" id="chk_${id}"></div>
    </span>
  </div>
  <#if i18nKey?starts_with("i18n:")>${i18nKey?replace("i18n:","")}<#else><@spring.message "${i18nKey}"/></#if>
</label>
</#macro>

<#macro inputTxt id i18nkey required=false type='texte' val='' class='' withLabel=false placeholder=''>
    <#if withLabel><small><@spring.message "${i18nkey}"/></small></#if>
    <input id="${id}" name="${id}" autocomplete="off" type="<#if type?matches('phone') || type?matches('date')>texte<#else>${type}</#if>" value="${val}" class="input-form<#if class?has_content> ${class}</#if>" <#if !withLabel>placeholder="<@spring.message "${i18nkey}"/>"</#if> <#if placeholder?has_content>placeholder="${placeholder}"</#if>
	<#if type?matches('email')> data-fv-field="email" data-fv-emailaddress-message="<@spring.message "form.validation.email"/>"</#if>
	<#if required> data-fv-notempty="true" data-fv-notempty-message="<@spring.message "form.validation.mandatory"/>"</#if>
	<#if type?matches('password')>		
		<#if !id?lower_case?contains('confirm') && !class?matches('signin-pwd')>pattern="^(?=.*\d)(?=.*[a-zA-Z])\w{6,}$" data-fv-regexp-message="<@spring.message "common.pwd.ko"/>"</#if>
	</#if>
	<#if type?matches('phone')>
		data-fv-phone="true" data-fv-phone-country="FR" data-fv-phone-message="<@spring.message "form.validation.phone"/>" 
	</#if>
	<#if type?matches('url')>data-fv-uri-message="<@spring.message "common.url.invalid"/>"</#if>
	<#if type?matches('numeric')>data-fv-numeric="true" data-fv-numeric-message="<@spring.message "common.numeric.invalid"/>" data-fv-numeric-separator=","</#if>
	<#if type?matches('date')>data-fv-date="true" data-fv-date-format="${dateFormat?upper_case}" data-fv-date-message="<@spring.message "common.date.invalid"/>"</#if>
	>
</#macro>

<#macro inputTextarea id i18nKey required=false value='' class='' rows='20' cols='4' maxlength='' withLabel=false>	
	<#if withLabel><small><@spring.message "${i18nKey}"/></small></#if>
	<textarea rows="${rows}" cols="${cols}" class="${class} input-block-level form-group noresize" <#if !withLabel>placeholder="<@spring.message "${i18nKey}"/>"</#if> name="${id}" id="${id}"  
        <#if required>required data-fv-message="<@spring.message "form.validation.mandatory"/>"</#if>
		<#if maxlength?has_content>maxlength="${maxlength}"</#if>>${value}</textarea>
</#macro>

<#macro header height1100px=true>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>BrandYouLike - by Effinity</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css" href="${baseHref}/libs/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link href="${baseHref}/css/bootstrap.css" rel="stylesheet">
<link href="${baseHref}/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${baseHref}/css/extension.css" rel="stylesheet">
<link href="${baseHref}/css/main.css" rel="stylesheet">
<link href="${baseHref}/css/style.css" rel="stylesheet">
<link href="${baseHref}/css/icon-fugue.min.css" rel="stylesheet">
<link href="${baseHref}/css/formValidation.min.css" rel="stylesheet">
<link href="${baseHref}/css/effinity.css" rel="stylesheet">
<link href="${baseHref}/css/rotating.css" rel="stylesheet" />
<link href="${baseHref}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<link href="${baseHref}/css/jquery.bxslider.css" rel="stylesheet">
<link rel="chrome-webstore-item"  href="https://chrome.google.com/webstore/detail/ailghnbkngdcidimelgonaafkajkdelo">

<!-- icons -->  
<link rel="stylesheet" href="${baseHref}/css/fontawesome/font-awesome.css"/>
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<script src="${baseHref}/libs/selectivizr/selectivizr-1.0.2/js/selectivizr.min.js"></script>
<script src="${baseHref}/libs/pl-visualization/excanvas/js/excanvas.min.js"></script>
<![endif]-->
<script src="${baseHref}/libs/jquery/jquery-1.9.1/jquery.min.js"></script>
<script src="${baseHref}/js/util.js"></script>
<script src="${baseHref}/libs/modernizr/modernizr-2.6.2/js/modernizr-2.6.2.js"></script>
<link rel="shortcut icon" href="${baseHref}/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${baseHref}/ico/boo-144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${baseHref}/ico/boo-114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${baseHref}/ico/boo-72.png">
<link rel="apple-touch-icon-precomposed" href="${baseHref}/ico/boo-57.png">
<style>

.product-overview {
	border: 1px solid !important;
	border-color: #d3d5d9 !important;
    background-color: #FFFFFF !important;
    color: #000 !important;
    padding-top: 0px !important;
    border-radius: 10px !important;
    font-family: 'Georgia' !important;  
    margin-left: 10px !important; 
    margin-bottom: 10px !important;    	
}

.product-overview img {
	height: 83px !important; 
	width: 83px !important; 
}

.product-overview img:hover{
	opacity: 0.2 !important; 
}

span.product-over-info {
	 display: none;
}

.product-overview:hover span.product-over-info {
	 display: block;
}

.product-overview:hover img {
	 opacity: 0.2 !important;
}

.product-over-info {
	display: block;
	position: relative;    
    left: 1px;
    top: -50px;
    height: 0px !important;
    opacity: 1 !important; 
}

#product-search-result div.product-search-result:hover div.product-search-result-wrapper {
	opacity: 0.2 !important; 
}

span.product-search-over-info {
	 display: none;
}

#product-search-result div.product-search-result:hover a span.product-search-over-info {
	 display: block;
}

#product-search-result div.product-search-result:hover a span.product-search-over-info {
	 display: block;
}

.product-search-over-info {
	display: block;
	position: relative;    
    left: 1px;
    top: -120px;
    height: 0px !important;
    opacity: 1 !important; 
    color: #000 !important;
}

.margintop15 {
	margin-top: 15px !important;
}

.marginleft10 {
	margin-left: 10px !important;
}

.marginleft30 {
	margin-left: 30px !important;
}
</style>
</head>
<body class="header-sticky sidebar-left background">
<div class="page-container">
  <div id="header-container">
    <div id="header">
      <div class="navtop" id="top">
        <div class="navtop-inner">
          <div class="container-fluid">
            <div class="">
              <ul class="nav user-menu">
                <li><a href="${baseHref}/secure/${id}/account" class="cententuser"><img class="user" id="avatar_1" src="<#if avatar?exists && avatar?has_content>${avatar}<#else>${baseHref}/img/logo_top.png</#if>"></a></li>
                <#assign links = ["article", "board", "deeplink", "box"] />
                <#list links as l>
                	<#if l?matches('article')><#assign icon='pencil'></#if>
                	<#if l?matches('board')><#assign icon='th-large'></#if>
                	<#if l?matches('deeplink')><#assign icon='list'></#if>
                	<#if l?matches('box')><#assign icon='th'></#if>
                	<li>
                		<a title="<@spring.message "decorator.link.${l}" />" href="${baseHref}/secure/${id}/${l}" class="nav-icons<#if activeIcon?matches(l)>-active</#if>">
                			<i class="fa fa-${icon}"></i>
                		</a>
                	</li>
				</#list>
                <li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><img src="${baseHref}/img/fleche.png"></a>
                  <ul class="dropdown-menu ssmenu hide">
                  	<#assign links = ["article", "board", "deeplink", "box", "invoice", "activity", "account"] />
                  	<#list links as l>
                    <li><a href="${baseHref}/secure/${id}/${l}"><@spring.message "decorator.link.${l}" /></a></li>
                    </#list>
                    <li class="divider"></li>
                    <li><a href="${baseHref}/logout"><@spring.message "decorator.tab.deconnect" /></a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="logo">
        <div id="logo-inner"><a class="brand" href="${baseHref}/secure/${id}/home"><img width="200" src="${baseHref}/img/logo.png" alt="logo"></a></div>        
      </div>
      <div class="navbar">
        <div class="navbar-inner">
          <div class="container-fluid">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            <div class="nav-collapse collapse">
              <#assign tabs = ["home", "partnership", "stat"] />
              <ul class="nav">
                <#list tabs as t>
                <li<#if activetab?exists && t?matches(activetab)> class="active"</#if>><a href="${baseHref}/secure/${id}/${t}"><@spring.message "decorator.tab.${t}" /></a> </li>
                </#list>
              </ul>
            </div>
          </div>
        </div>
        <div class="navbar-blog">
			<a target="_blank" href="http://blog.brandyoulike.com" class="btn btn-blue btn-normal"><@spring.message "home.blog" /></a> 
        </div>
      </div>
    </div>
  </div>
  <div id="main-container"<#if height1100px> style='height:1100px'</#if>>
  <div class="pages-content">
</#macro>

<#macro footer script="" blueFooter=false>
  </div>
  </div>
  <div <#if blueFooter>class="popin_footer"<#else>id="Footer-container"</#if>></div>
  <div id="ajax-modal" class="modal hide" tabindex="-1"></div>
</div>
<script src="${baseHref}/libs/jquery/jquery.migrate-1.1.1/jquery-migrate.min.js"></script>
<script src="${baseHref}/libs/jquery/jquery.ui.combined-1.10.2/jquery-ui.min.js"></script>
<script src="${baseHref}/libs/bootstrap/js/bootstrap.min.js"></script>
<script src="${baseHref}/libs/pl-file/jquery.file.upload/js/jquery.fileupload.js"></script>
<script src="${baseHref}/libs/pl-content/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
<script src="${baseHref}/libs/pl-content/bootstrap-modal/js/bootstrap-modal.js"></script>
<script src="${baseHref}/libs/pl-form/bootstrap-select/js/bootstrap-select.js"></script>
<script src="${baseHref}/libs/pl-form/select2/js/select2.js"></script>
<script src="${baseHref}/js/formvalidation/formValidation.min.js"></script>
<script src="${baseHref}/js/formvalidation/framework.bootstrap.min.js"></script>
<script src="${baseHref}/js/moment/moment.min.js"></script>
<script src="${baseHref}/js/datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${baseHref}/libs/pl-table/datatables/js/jquery.dataTables.js"></script>
<script src="${baseHref}/libs/pl-table/datatables/js/jquery.dataTables.plugins.js"></script>
<script src="${baseHref}/libs/pl-table/datatables/js/jquery.dataTables.columnFilter.js"></script>
<script src="${baseHref}/libs/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script src="${baseHref}/libs/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script src="${baseHref}/libs/pl-visualization/flot/js/jquery.flot.js"></script>
<script src="${baseHref}/libs/pl-system-info/qtip2/js/jquery.qtip.min.js"></script>
<script src="${baseHref}/libs/bxslider/jquery.bxslider.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="${baseHref}/js/jquery.panzoom.js"></script>

<#-- Planches produit -->
<script src="${baseHref}/img/Effenity_files/jquery.nicescroll.min.js"></script>

<script>
function show_result(type, deb, fin) {
	$('#more_'+type+'_'+deb).hide();
	for (var i = deb; i <= fin; i++) {
		$('#line_'+type+'_'+i).show();
	}
}

function fiche(id,tab) {
	
	var url = '${baseHref}/secure/${id}/fiche';
	url += tab ? tab : ''; 
	url += '/'+id;	
	
	$('#back_form').attr('action', url);
	$('#back_form').submit();
}

function sinscrire(id) {
	open_modal('${baseHref}/secure/${id}/ajaxsinscrire/'+id);
}

function merchants_by_cat(id) {
	$.ajax({
		url: '${baseHref}/secure/${id}/ajaxsannonceur',
		type: 'POST',
		data: {
			id_categorie: id,
			color: $('#cat_color_'+id).val(),
			wording: $('#cat_name_'+id).text()
		},
		success: function(html) {
			$('#annonceurs_'+id).html(html);
		}
	});	
}

function get_compteur(offset) {
	var ids = $('#id_session_'+offset).val();
	if(ids > 0) {
	 	$.ajax({
			url: '${baseHref}/secure/${id}/ajaxcompteur',
			type: 'post',
			data: {
				id_session: $('#id_session_'+offset).val(), 
				id_lien: $('#id_lien_'+offset).val()
			},
			success: function(html) {
				$('#textareageneric_'+offset).val($('#textareageneric_'+offset).val().replace('**id_compteur**', html).replace('**id_compteur**', html));
			}
		});
	}
}

function copythat(id) {
	$('#textareageneric_'+id).select();   
    $('#copythatmsg_'+id).slideDown('slow');
    setTimeout(function(){$('#copythatmsg_'+id).hide();},5000);
    document.execCommand('copy');
}

</script>
<#if script?exists && script?has_content>
<script>
${script}
</script>
</#if>

<#if onboarding?exists && onboarding?matches("ok")>
<script>
$(document).ready(function() {
	open_modal('${baseHref}/secure/${id}/onboarding');
});
</script>
</#if>

<form method="post" action="" name="back_form" id="back_form" target="_parent">
	<input type="hidden" name="back_from" id="back_from" value="<#if back_from?exists>${back_from}</#if>" />
	<input type="hidden" name="back_type" id="back_type" value="<#if back_type?exists>${back_type}</#if>" />
	<input type="hidden" name="back_id_typeliens" id="back_id_typeliens" value="<#if back_id_typeliens?exists>${back_id_typeliens}</#if>" />
	<input type="hidden" name="back_id_categorie" id="back_id_categorie" value="<#if back_id_categorie?exists>${back_id_categorie}</#if>" />
	<input type="hidden" name="back_id_affilieur" id="back_id_affilieur" value="<#if back_id_affilieur?exists>${back_id_affilieur}</#if>" />
	<input type="hidden" name="back_q" id="back_q" value="<#if back_q?exists>${back_q}</#if>" />
	<input type="hidden" name="id" id="id" value="${id}" />
</form>
</body>
</html>
</#macro>

<#macro signHeader formValidation=false googleAppId="" pixelFb=false pixelGoogle=false>
	<!DOCTYPE html>
	<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
	<!--[if IE 7]>    <html class="lt-ie9 lt-ie8"> <![endif]-->
	<!--[if IE 8]>    <html class="lt-ie9"> <![endif]-->
	<!--[if gt IE 8]><!-->
	<html>
	<!--<![endif]-->
		<head>
		<meta charset="utf-8">
		<title>BrandYouLike - by Effinity</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="description" content="">
		<meta name="author" content="">
		<#if googleAppId?has_content><meta name="google-signin-client_id" content="${googleAppId}"></#if>
		<!-- Le styles -->
		<link rel="stylesheet" href="${baseHref}/css/bootstrap.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/fontawesome/font-awesome.css"/>
		<link rel="stylesheet" href="${baseHref}/css/bootstrap-social.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/bootstrap-responsive.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/extension.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/main.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="${baseHref}/css/icon-fugue.min.css" rel="stylesheet">
		<#if formValidation>
			<link rel="stylesheet" href="${baseHref}/css/formValidation.min.css" rel="stylesheet">
		</#if>
		<link rel="stylesheet" href="${baseHref}/css/effinity.css" rel="stylesheet">		
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script src="${baseHref}/libs/selectivizr/selectivizr-1.0.2/js/selectivizr.min.js"></script>
		<script src="${baseHref}/libs/pl-visualization/excanvas/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="${baseHref}/libs/modernizr/modernizr-2.6.2/js/modernizr-2.6.2.js"></script>
		<#if googleAppId?has_content>
			<script src="https://apis.google.com/js/platform.js" async defer></script>			
			<script src="https://plus.google.com/js/client:plusone.js" type="text/javascript"></script>
		</#if>		
		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${baseHref}/ico/favicon.ico">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${baseHref}/ico/boo-144.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${baseHref}/ico/boo-114.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${baseHref}/ico/boo-72.png">
		<link rel="apple-touch-icon-precomposed" href="${baseHref}/ico/boo-57.png">
		<#if pixelFb>
			<script>
			   //pixel fb
			   !function(f,b,e,v,n,t,s)
				{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
				n.callMethod.apply(n,arguments):n.queue.push(arguments)};
				if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
				n.queue=[];t=b.createElement(e);t.async=!0;
				t.src=v;s=b.getElementsByTagName(e)[0];
				s.parentNode.insertBefore(t,s)}(window,document,'script',
				'https://connect.facebook.net/en_US/fbevents.js');
				
				fbq('init', '1391905537806557');
				fbq('track', "PageView"); 
			</script>
			<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1391905537806557&ev=PageView&noscript=1"/></noscript>			
		</#if>
		<#if pixelGoogle>
			<!-- Google Code for Inscription Influenceur Conversion Page -->
			<script type="text/javascript">
				/* <![CDATA[ */
				var google_conversion_id = 959169149;
				var google_conversion_language = "en";
				var google_conversion_format = "3";
				var google_conversion_color = "ffffff";
				var google_conversion_label = "XsuDCJWSom8Q_YSvyQM";
				var google_remarketing_only = false;
				/* ]]> */
			</script>
			<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
			</script>
			<noscript>
				<div style="display:inline;">
					<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/959169149/?label=XsuDCJWSom8Q_YSvyQM&amp;guid=ON&amp;script=0"/>
				</div>
			</noscript>
		</#if>
	</head>
	<body class="header-sticky sidebar-left ">
   		<div id="main-container">
</#macro>

<#macro signFooter script='' formValidation=false>
   </div>
		<script src="${baseHref}/libs/jquery/jquery-1.9.1/jquery.min.js"></script>
		<script src="${baseHref}/libs/jquery/jquery.migrate-1.1.1/jquery-migrate.min.js"></script>
		<script src="${baseHref}/libs/jquery/jquery.ui.combined-1.10.2/jquery-ui.min.js"></script>
		<script src="${baseHref}/libs/bootstrap/js/bootstrap.min.js"></script>
		<script src="${baseHref}/js/util.js"></script>
		<#if formValidation>
			<script src="${baseHref}/js/formvalidation/formValidation.min.js"></script>
			<script src="${baseHref}/js/formvalidation/framework.bootstrap.min.js"></script>
		</#if>
		<#if script?has_content>
			${script}
		</#if>
	</body>	
</html>	
</#macro>

<#macro disableF5>
	<script>
		function disableF5(e) { 
		  if ((e.which || e.keyCode) == 116) 
		     e.preventDefault(); 
		};
		$(document).on("keydown", disableF5);
	</script>
</#macro>

<#macro th i18nKey class='' sort=false>
	<th class="${class}" scope="col"><@spring.message "${i18nKey}"/><#if sort><span class="column-sorter"></span></#if></th>
</#macro>

<#macro formatNbCurrency nb>${nb?c?number?string(",##0.00")} &euro;</#macro>
<#macro formatNb nb>${nb?c?number?string(",##0.00")}</#macro>

<#macro spinner id='' visible=false class=''>
	<img <#if class?has_content>class="${class}"</#if> src="${baseHref}/img/spinner.gif" <#if id?has_content>id="${id}"</#if> <#if !visible>style="display:none"</#if>/>
</#macro>

<#macro inputSelect values id='' value='' placeholderI18n='' class='' multiple=false required=false disabled=false>
  <select<#if disabled> disabled</#if> <#if required> data-fv-notempty="true" data-fv-notempty-message="<@spring.message "form.validation.mandatory"/>"</#if><#if placeholderI18n?has_content> placeholder="<@spring.message "${placeholderI18n}"/>" </#if> id="${id}" name="${id}" class="selecttwo<#if class?has_content> ${class}</#if>" <#if multiple>multiple</#if>>
      <#list values as val>
      	<option <#if val.id?matches(value)>selected="selected"</#if> value="${val.id}">${val.libelle}</option>
      </#list>
  </select>
</#macro>

<#macro btn class i18nKey id='' type=''>
	<button <#if type?has_content>type="${type}"</#if> class="btn ${class}" <#if id?has_content>id="${id}"</#if>><@spring.message "${i18nKey}"/></button>
</#macro>

<#macro truncString chaine nb popover=false><#assign out = chaine?right_pad(nb)><#if out?length==nb>${chaine}<#else>${out?substring(0, nb)}...<#if popover><a class="popover-element" data-trigger="hover" data-content="${chaine}" href="#"><i class="fa fa-info-circle"></i></a></#if></#if></#macro>

<#macro productFound product>
	<div class="span4 well well-nice well-small picture product-search-result">
		  <a class="product-search-result-a" href="<#if product.id_product?has_content>javascript:addProduct('${product.id_product}')</#if>">
			  <div class="product-search-result-wrapper">
				  <div class="detail_picture"><img id="product-img-<#if product.id_product?has_content>${product.id_product}</#if>" src="<#if product.url_image?has_content>${product.url_image}</#if>" class="well_img"></div>
				  <div class="statistic-picture">
				      <div class="product-name footer">
				        <label class="product-add"> 			
						<#if product.name?has_content><@truncString product.name 20/></#if>
						<br><span><#if product.price?has_content>${product.price}</#if><#if product.currency?has_content> ${product.currency}</#if></span>
						</label>                        
				      </div>
				  </div>
			  </div>
		  	  <span class="product-search-over-info"><@spring.message "common.ajouter" /></span>
		  </a>
	</div>
</#macro>

<#macro productOverview product>
	<#if product.id_product?has_content>
		<a href="javascript:deleteProduct('${product.id_product}')">
			<div id="overview-${product.id_product}" class="span2 product-overview">
				<img src="<#if product.url_image?has_content>${product.url_image}</#if>" class="well_img"/>
				<span class="product-over-info"><@spring.message "common.delete" /></span>
			</div>
		</a>
	</#if>
</#macro>

<#macro urlDisplay url>
<#if url?has_content>${url?lower_case?replace('http://','')?replace('https://','')?replace('www.','')}</#if>
</#macro>

<#macro showDate date withHours=false><#if withHours><#assign newdf=dateFormat+' HH:mm:ss'/>${date?string(newdf)}<#else>${date?string(dateFormat)}</#if></#macro>

<#macro facebookSDK fbAppId>
	<script>
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '${fbAppId}',
	      xfbml      : true,
	      version    : 'v2.5'
	    });
	  };
	
	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "//connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
	</script>
</#macro>