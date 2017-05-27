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
    <div class="topnav" id="myTopnav">
        <div id="grailsLogo" role="banner"><a href="${createLink(uri: '/')}"><asset:image src="grails_logo.png" alt="Grails"/></a></div>
        <a href="${createLink(uri: '/alimentacion/create')}"> <asset:image src="ICONS/iconitos-02.png" /> Alimentación</a>
        <a href="${createLink(uri: '/lote/etapas')}"> <asset:image src="ICONS/iconitos-03.png" /> Etapas</a>
        <a href="${createLink(uri: '/vacunaLote/create')}"> <asset:image src="ICONS/iconitos-04.png" /> Vacunas</a>
        <a href="${createLink(uri: '/madre/create')}"> <asset:image src="ICONS/iconitos-05.png" /> Madres</a>
        <a href="${createLink(uri: '/padre/create')}"> <asset:image src="ICONS/iconitos-05.png" /> Padres</a>
        <a href="${createLink(uri: '/padre/create')}"> <asset:image src="ICONS/iconitos-19.png" /> Base de datos</a>
        <g:remoteLink controller="logout" method="post" onSuccess="location.reload()"> <asset:image src="ICONS/iconitos-17.png" /> Log Out</g:remoteLink>
    </div>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
