<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Mexus"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<asset:stylesheet src="bootstrap.css"/>
		<asset:stylesheet src="bootstrap-theme.css"/>
		<g:layoutHead/>
	</head>
	<body>
    <sec:ifLoggedIn>
        <div class="topnav" id="myTopnav">
            <div id="grailsLogo" role="banner"><a href="${createLink(uri: '/inicio')}"><asset:image src="grails_logo.png" alt="Grails"/></a></div>
            %{--<a href="${createLink(uri: '/alimentacion/create')}"> <asset:image src="ICONS/Artboard 2 copy.png" /> Alimentación</a>
            <a href="${createLink(uri: '/lote/etapas')}"> <asset:image src="ICONS/Artboard 2 copy 2.png" /> Etapas</a>
            <a href="${createLink(uri: '/vacunaLote/create')}"> <asset:image src="ICONS/Artboard 2 copy 3.png" /> Vacunas</a>
            <a href="${createLink(uri: '/madre/create')}"> <asset:image src="ICONS/Artboard 2 copy 5.png" /> Madres</a>
            <a href="${createLink(uri: '/padre/create')}"> <asset:image src="ICONS/Artboard 2 copy 4.png" /> Padres</a>
            <a href="${createLink(uri: '/padre/create')}"> <asset:image src="ICONS/Artboard 2 copy 13.png" /> Base de datos</a>
            <g:remoteLink controller="logout" method="post" onSuccess="location.reload()"> <asset:image src="ICONS/Artboard 2 copy 9.png" /> Log Out</g:remoteLink>--}%
            <a class="rayanav" href="${createLink(uri: '/alimentacion/create')}"> <asset:image class="imgc" src="ICONS/5_alimentacion.png" /> ALIMENTACIÓN</a>
            <a class="rayanav" href="${createLink(uri: '/lote/etapas')}"> <asset:image class="imgc" src="ICONS/6_etapas.png" /> ETAPAS</a>
            <a class="rayanav" href="${createLink(uri: '/vacunaLote/create')}"> <asset:image class="imgc" src="ICONS/7_vacunas.png" /> VACUNAS</a>
            <a class="rayanav" href="${createLink(uri: '/madre/create')}"> <asset:image class="imgc" src="ICONS/9_madre.png" /> MADRES</a>
            <a class="rayanav" href="${createLink(uri: '/padre/create')}"> <asset:image class="imgc" src="ICONS/8_padre.png" /> PADRES</a>
            <a class="rayanav" href="${createLink(uri: '/baseDatos/index')}"> <asset:image class="imgc" src="ICONS/10_base_de_datos.png" /> BASE DE DATOS</a>
            <g:remoteLink controller="logout" method="post" onSuccess="location.reload()"> <asset:image class="imgc" src="ICONS/12_logout.png" /> LOG OUT</g:remoteLink>
        </div>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <asset:image class="loginlogo" src="grails_log.png"/>
    </sec:ifNotLoggedIn>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
